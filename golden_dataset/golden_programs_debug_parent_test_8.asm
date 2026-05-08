; DESCRIPTION: This GeOS assembly code tests a parent process that spawns a child process (`debug_monitor`) using SPAWNC and communicates with it via a mailbox at Page 3. The parent waits for the child to initialize, checks a magic value to confirm its presence, sends a PING command, waits for a PONG response, and then tests REGS communication, displaying results on the screen.

; debug_parent_test.asm -- Test parent that communicates with debug_monitor
;
; Loads debug_monitor as a child via SPAWNC, then pings it via Page 3 mailbox.
; Run this as the main program (with debug_monitor.asm assembled to /tmp/debug_monitor.bin).

LDI r10, 1
LDI r30, 0xFD00

; Clear screen
LDI r8, 0x101820
FILL r8

; Draw title
LDI r20, 0x1000
STRO r20, "Debug Parent Test"
LDI r10, 10
LDI r14, 10
LDI r11, 0x1000
LDI r9, 0x00FF00
LDI r2, 0x101820
DRAWTEXT r10, r14, r11, r9, r2

; ── Wait for child to initialize ──
LDI r20, 0x2000
STRO r20, "Waiting for child..."
LDI r10, 10
LDI r14, 30
LDI r11, 0x2000
LDI r9, 0xFFFFFF
LDI r2, 0x101820
DRAWTEXT r10, r14, r11, r9, r2

; Wait a bunch of frames for child to set up its debug stub
LDI r0, 60
wait_init:
    FRAME
    SUBI r0, 1
    CMPI r0, 0
    JNZ r8, wait_init

; ── Check magic ──
LDI r20, 0x0C00
LOAD r22, r20
LDI r23, 0xDB9900
CMP r22, r23

; Display magic check result
LDI r20, 0x2100
LDI r10, 10
LDI r14, 50
CMPI r8, 0
JNZ r8, magic_fail
STRO r20, "Magic OK! Sending PING..."
JMP magic_done
magic_fail:
STRO r20, "No magic found!"
magic_done:
LDI r11, 0x2100
LDI r9, 0xFFFF00
LDI r2, 0x101820
DRAWTEXT r10, r14, r11, r9, r2

; ── Send PING command ──
LDI r8, 3
LDI r20, 0x0C03
STORE r20, r8         ; COMMAND = 3 (ping)
LDI r8, 1
LDI r20, 0x0C04
STORE r20, r8         ; STATUS = 1 (pending)

; Wait for response
LDI r6, 200
ping_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r8, ping_got
    SUBI r6, 1
    CMPI r6, 0
    JNZ r8, ping_wait

; Timeout
LDI r20, 0x2200
STRO r20, "PING TIMEOUT!"
LDI r10, 10
LDI r14, 70
LDI r11, 0x2200
LDI r9, 0xFF4444
LDI r2, 0x101820
DRAWTEXT r10, r14, r11, r9, r2
JMP done

ping_got:
; Clear status
LDI r8, 0
LDI r20, 0x0C04
STORE r20, r8

; Check response
LDI r20, 0x0C05
LOAD r22, r20
LDI r23, 0x504E4720
CMP r22, r23

LDI r20, 0x2200
LDI r10, 10
LDI r14, 70
CMPI r8, 0
JNZ r8, pong_fail
STRO r20, "PONG received! Bridge works!"
JMP pong_done
pong_fail:
STRO r20, "Bad response"
pong_done:
LDI r11, 0x2200
LDI r9, 0x44FF44
LDI r2, 0x101820
DRAWTEXT r10, r14, r11, r9, r2

; ── Now test REGS ──
LDI r8, 1
LDI r20, 0x0C03
STORE r20, r8
LDI r8, 1
LDI r20, 0x0C04
STORE r20, r8

LDI r6, 200
regs_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r8, regs_got
    SUBI r6, 1
    CMPI r6, 0
    JNZ r8, regs_wait

LDI r20, 0x2300
STRO r20, "REGS TIMEOUT!"
JMP show_regs
regs_got:
LDI r8, 0
LDI r20, 0x0C04
STORE r20, r8

LDI r20, 0x2300
STRO r20, "REGS OK!"

show_regs:
LDI r10, 10
LDI r14, 90
LDI r11, 0x2300
LDI r9, 0x4488FF
LDI r2, 0x101820
DRAWTEXT r10, r14, r11, r9, r2

done:
FRAME
JMP done
