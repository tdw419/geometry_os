; swarm_monitor.asm -- Area Agent Swarm Health Dashboard
;
; This program monitors the 8 Area Agent slots at 0x7950.
; It displays each agent's role, status, and task coordinates.

#define AGENT_BASE 0x7950
#define AGENT_SIZE 0x10

#define STATUS_IDLE 0
#define STATUS_INSPECTING 1
#define STATUS_REPAIRING 2
#define STATUS_DONE 3

#define ROLE_MAINT 0
#define ROLE_COMP 1
#define ROLE_SHELL 2
#define ROLE_NEURAL 3
#define ROLE_GPU 4
#define ROLE_INPUT 5
#define ROLE_SVC 6
#define ROLE_DEV 7

#define SYSCALL_AGENT_CONTROL 11

:main
    ; Ensure AreaManager is active
    LDI r1, 1 ; cmd = start
    LDI r0, 11 ; SYSCALL_AGENT_CONTROL
    SYSCALL 0

:loop
    FILL 0x050510 ; Deep blue/black background
    
    LDI r20, 10
    LDI r21, 15
    TEXTI 10, 15, "VAST SUBSTRATE SWARM MONITOR"
    
    ; Header
    LDI r5, 0x888888 ; Gray
    TEXTI 10, 30, "ID   ROLE       STATUS      TASK"
    LINEI 10, 38, 240, 38, 0x888888

    LDI r10, 0 ; agent index (0-7)
:draw_agents
    ; Compute RAM base for this agent
    MOV r11, r10
    LDI r12, AGENT_SIZE
    MUL r11, r12
    LDI r12, AGENT_BASE
    ADD r11, r12 ; r11 = agent entry addr
    
    ; Load fields
    LOAD r1, r11       ; target_x (offset 0)
    ADDI r11, 1
    LOAD r2, r11       ; target_y (offset 1)
    ADDI r11, 1
    LOAD r3, r11       ; status   (offset 2)
    ADDI r11, 6
    LOAD r4, r11       ; role     (offset 8)
    
    ; Compute Y position
    LDI r21, 45
    LDI r22, 15
    MUL r22, r10
    ADD r21, r22       ; y = 45 + i*15
    
    ; Draw ID
    ; (We need to draw the number r10)
    ; For now, just draw placeholders or simple bars
    
    ; Role Color
    LDI r5, 0x00FF00 ; Green (Default)
    CMPI r4, ROLE_COMP
    JNZ r0, :not_comp
    LDI r5, 0x00FFFF ; Cyan
:not_comp
    CMPI r4, ROLE_SHELL
    JNZ r0, :not_shell
    LDI r5, 0xFF00FF ; Magenta
:not_shell
    
    RECTI 10, r21, 5, 8, r5
    
    ; Status Indicator
    LDI r6, 0x333333 ; Gray (Idle)
    CMPI r3, STATUS_INSPECTING
    JNZ r0, :not_ins
    LDI r6, 0xFFFF00 ; Yellow
:not_ins
    CMPI r3, STATUS_REPAIRING
    JNZ r0, :not_rep
    LDI r6, 0xFF0000 ; Red
:not_rep
    CMPI r3, STATUS_DONE
    JNZ r0, :not_done
    LDI r6, 0x00FF00 ; Green
:not_done
    
    RECTI 100, r21, 40, 8, r6
    
    ADDI r10, 1
    CMPI r10, 8
    JNZ r0, :draw_agents

    FRAME
    JMP :loop
