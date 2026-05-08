; DESCRIPTION: A red object centered at the screen with fixed size.

; flatliner.asm -- Test program that simulates a crash
;
; Updates heartbeat 5 times, then stops.
; Used to test the watchdog/recovery system.
;
; Page 3 Debug Mailbox:
;   0x0C00: DEBUG_MAGIC (0xDB9900)
;   0x0C02: DEBUG_CHILD_PID
;   0x0C27: DEBUG_HEARTBEAT
;   0x0C28: DEBUG_CHECKPOINT

#define DEBUG_MAGIC      0x0C00
#define DEBUG_CHILD_PID  0x0C02
#define DEBUG_HEARTBEAT  0x0C27
#define DEBUG_CHECKPOINT 0x0C28

LDI r11, 1
LDI r30, 0xFD00

; Fill with dark red
LDI r8, 0x2A0A0A
FILL r8

; Draw "FLATLINER" label
LDI r20, 0x1000
STRO r20, "Flatliner"
LDI r11, 10
LDI r2, 10
LDI r1, 0x1000
LDI r12, 0xFF0000
LDI r13, 0x2A0A0A
DRAWTEXT r11, r2, r1, r12, r13

; Initialize debug mailbox
LDI r8, 0xDB9900
LDI r20, DEBUG_MAGIC
STORE r20, r8

GETPID
LDI r20, DEBUG_CHILD_PID
STORE r20, r8

LDI r8, 0
LDI r20, DEBUG_HEARTBEAT
STORE r20, r8

; Counter: update heartbeat 5 times then crash
LDI r13, 5

beat_loop:
    FRAME

    ; Update heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r8, r20
    ADDI r8, 1
    STORE r20, r8

    ; Update checkpoint
    LDI r20, DEBUG_CHECKPOINT
    LDI r8, beat_loop
    STORE r20, r8

    ; Decrement counter
    SUBI r13, 1
    CMPI r13, 0
    JZ r8, crash_now
    JMP beat_loop

crash_now:
    ; Simulate a crash: just halt (no more FRAME, no more heartbeat updates)
    ; Draw a red X to show we're "dead"
    LDI r8, 0xFF0000
    LDI r11, 50
    LDI r2, 50
    LDI r1, 50
    LDI r12, 50
    RECTF r11, r2, r1, r12, r8

dead_loop:
    ; Infinite loop with no FRAME -- the heartbeat stops updating
    JMP dead_loop
