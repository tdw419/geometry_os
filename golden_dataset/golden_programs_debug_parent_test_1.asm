; DESCRIPTION: This GeOS assembly code tests a parent process that spawns a child process (`debug_monitor`) using SPAWNC and communicates with it via a mailbox at Page 3. The parent waits for the child to initialize, checks a magic value to confirm its presence, sends a PING command, waits for a PONG response, and then tests REGS communication, displaying results on the screen.

; debug_parent_test.asm -- Test parent that communicates with debug_monitor
;
; Loads debug_monitor as a child via SPAWNC, then pings it via Page 3 mailbox.
; Run this as the main program (with debug_monitor.asm assembled to /tmp/debug_monitor.bin).

LDI r13, 1
LDI r30, 0xFD00

; Clear screen
LDI r11, 0x101820
FILL r11

; Draw title
LDI r20, 0x1000
STRO r20, "Debug Parent Test"
LDI r13, 10
LDI r1, 10
LDI r2, 0x1000
LDI r8, 0x00FF00
LDI r7, 0x101820
DRAWTEXT r13, r1, r2, r8, r7

; ── Wait for child to initialize ──
LDI r20, 0x2000
STRO r20, "Waiting for child..."
LDI r13, 10
LDI r1, 30
LDI r2, 0x2000
LDI r8, 0xFFFFFF
LDI r7, 0x101820
DRAWTEXT r13, r1, r2, r8, r7

; Wait a bunch of frames for child to set up its debug stub
LDI r3, 60
wait_init:
    FRAME
    SUBI r3, 1
    CMPI r3, 0
    JNZ r11, wait_init

; ── Check magic ──
LDI r20, 0x0C00
LOAD r22, r20
LDI r23, 0xDB9900
CMP r22, r23

; Display magic check result
LDI r20, 0x2100
LDI r13, 10
LDI r1, 50
CMPI r11, 0
JNZ r11, magic_fail
STRO r20, "Magic OK! Sending PING..."
JMP magic_done
magic_fail:
STRO r20, "No magic found!"
magic_done:
LDI r2, 0x2100
LDI r8, 0xFFFF00
LDI r7, 0x101820
DRAWTEXT r13, r1, r2, r8, r7

; ── Send PING command ──
LDI r11, 3
LDI r20, 0x0C03
STORE r20, r11         ; COMMAND = 3 (ping)
LDI r11, 1
LDI r20, 0x0C04
STORE r20, r11         ; STATUS = 1 (pending)

; Wait for response
LDI r4, 200
ping_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r11, ping_got
    SUBI r4, 1
    CMPI r4, 0
    JNZ r11, ping_wait

; Timeout
LDI r20, 0x2200
STRO r20, "PING TIMEOUT!"
LDI r13, 10
LDI r1, 70
LDI r2, 0x2200
LDI r8, 0xFF4444
LDI r7, 0x101820
DRAWTEXT r13, r1, r2, r8, r7
JMP done

ping_got:
; Clear status
LDI r11, 0
LDI r20, 0x0C04
STORE r20, r11

; Check response
LDI r20, 0x0C05
LOAD r22, r20
LDI r23, 0x504E4720
CMP r22, r23

LDI r20, 0x2200
LDI r13, 10
LDI r1, 70
CMPI r11, 0
JNZ r11, pong_fail
STRO r20, "PONG received! Bridge works!"
JMP pong_done
pong_fail:
STRO r20, "Bad response"
pong_done:
LDI r2, 0x2200
LDI r8, 0x44FF44
LDI r7, 0x101820
DRAWTEXT r13, r1, r2, r8, r7

; ── Now test REGS ──
LDI r11, 1
LDI r20, 0x0C03
STORE r20, r11
LDI r11, 1
LDI r20, 0x0C04
STORE r20, r11

LDI r4, 200
regs_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r11, regs_got
    SUBI r4, 1
    CMPI r4, 0
    JNZ r11, regs_wait

LDI r20, 0x2300
STRO r20, "REGS TIMEOUT!"
JMP show_regs
regs_got:
LDI r11, 0
LDI r20, 0x0C04
STORE r20, r11

LDI r20, 0x2300
STRO r20, "REGS OK!"

show_regs:
LDI r13, 10
LDI r1, 90
LDI r2, 0x2300
LDI r8, 0x4488FF
LDI r7, 0x101820
DRAWTEXT r13, r1, r2, r8, r7

done:
FRAME
JMP done
