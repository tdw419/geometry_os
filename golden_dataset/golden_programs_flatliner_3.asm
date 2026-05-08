; DESCRIPTION: Draws a red object at the screen with fixed size.

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

LDI r4, 1
LDI r30, 0xFD00

; Fill with dark red
LDI r12, 0x2A0A0A
FILL r12

; Draw "FLATLINER" label
LDI r20, 0x1000
STRO r20, "Flatliner"
LDI r4, 10
LDI r13, 10
LDI r11, 0x1000
LDI r9, 0xFF0000
LDI r3, 0x2A0A0A
DRAWTEXT r4, r13, r11, r9, r3

; Initialize debug mailbox
LDI r12, 0xDB9900
LDI r20, DEBUG_MAGIC
STORE r20, r12

GETPID
LDI r20, DEBUG_CHILD_PID
STORE r20, r12

LDI r12, 0
LDI r20, DEBUG_HEARTBEAT
STORE r20, r12

; Counter: update heartbeat 5 times then crash
LDI r3, 5

beat_loop:
    FRAME

    ; Update heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r12, r20
    ADDI r12, 1
    STORE r20, r12

    ; Update checkpoint
    LDI r20, DEBUG_CHECKPOINT
    LDI r12, beat_loop
    STORE r20, r12

    ; Decrement counter
    SUBI r3, 1
    CMPI r3, 0
    JZ r12, crash_now
    JMP beat_loop

crash_now:
    ; Simulate a crash: just halt (no more FRAME, no more heartbeat updates)
    ; Draw a red X to show we're "dead"
    LDI r12, 0xFF0000
    LDI r4, 50
    LDI r13, 50
    LDI r11, 50
    LDI r9, 50
    RECTF r4, r13, r11, r9, r12

dead_loop:
    ; Infinite loop with no FRAME -- the heartbeat stops updating
    JMP dead_loop
