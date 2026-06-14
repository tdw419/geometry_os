; swarm_init.asm -- Configures the specialized swarm for Phase U
;
; This program assigns 7 specialized agents to different regions
; and then transitions to the monitor.

#define ROLE_MAINT 0
#define ROLE_COMP 1
#define ROLE_SHELL 2
#define ROLE_NEURAL 3
#define ROLE_GPU 4
#define ROLE_INPUT 5
#define ROLE_SVC 6
#define ROLE_DEV 7

#define SYSCALL_AGENT_ASSIGN 10
#define SYSCALL_AGENT_CONTROL 11
#define SYSCALL_CHAIN_LOAD 12

:main
    ; Stop existing swarm first
    LDI r1, 2 ; cmd = stop
    LDI r0, SYSCALL_AGENT_CONTROL
    SYSCALL 0

    ; Agent 1: Compositor (0, 0)
    LDI r1, ROLE_COMP
    LDI r2, 0
    LDI r3, 0
    LDI r4, 256
    LDI r5, 256
    LDI r0, SYSCALL_AGENT_ASSIGN
    SYSCALL 0

    ; Agent 2: Shell (256, 0)
    LDI r1, ROLE_SHELL
    LDI r2, 256
    LDI r3, 0
    LDI r4, 256
    LDI r5, 256
    LDI r0, SYSCALL_AGENT_ASSIGN
    SYSCALL 0

    ; Agent 3: Neural (512, 0)
    LDI r1, ROLE_NEURAL
    LDI r2, 512
    LDI r3, 0
    LDI r4, 256
    LDI r5, 256
    LDI r0, SYSCALL_AGENT_ASSIGN
    SYSCALL 0

    ; Agent 4: GPU (0, 256)
    LDI r1, ROLE_GPU
    LDI r2, 0
    LDI r3, 256
    LDI r4, 256
    LDI r5, 256
    LDI r0, SYSCALL_AGENT_ASSIGN
    SYSCALL 0
    
    ; Agent 5: Input (256, 256)
    LDI r1, ROLE_INPUT
    LDI r2, 256
    LDI r3, 256
    LDI r4, 256
    LDI r5, 256
    LDI r0, SYSCALL_AGENT_ASSIGN
    SYSCALL 0

    ; Start the swarm
    LDI r1, 1 ; cmd = start
    LDI r0, SYSCALL_AGENT_CONTROL
    SYSCALL 0

    ; Spawn repair agents
    LDI r20, 0x4100
    STRO r20, "repair_agent.asm"
    
    ; Spawn 4 agents
    MOV r1, r20
    EXEC r1
    EXEC r1
    EXEC r1
    EXEC r1

    ; Transition to monitor
    LDI r20, 0x4000 ; buffer for string
    STRO r20, "programs/swarm_monitor.asm"
    MOV r1, r20
    LDI r0, SYSCALL_CHAIN_LOAD
    SYSCALL 0
    
    HALT
