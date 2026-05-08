; DESCRIPTION: The GeOS assembly code simulates a crash by initializing a debug mailbox, updating its heartbeat five times, and then halting execution to draw a red 'X' on the screen, effectively stopping further updates. This is used to test the watchdog/recovery system.

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

LDI r13, 1
LDI r30, 0xFD00

; Fill with dark red
LDI r1, 0x2A0A0A
FILL r1

; Draw "FLATLINER" label
LDI r20, 0x1000
STRO r20, "Flatliner"
LDI r13, 10
LDI r14, 10
LDI r15, 0x1000
LDI r9, 0xFF0000
LDI r4, 0x2A0A0A
DRAWTEXT r13, r14, r15, r9, r4

; Initialize debug mailbox
LDI r1, 0xDB9900
LDI r20, DEBUG_MAGIC
STORE r20, r1

GETPID
LDI r20, DEBUG_CHILD_PID
STORE r20, r1

LDI r1, 0
LDI r20, DEBUG_HEARTBEAT
STORE r20, r1

; Counter: update heartbeat 5 times then crash
LDI r4, 5

beat_loop:
    FRAME

    ; Update heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r1, r20
    ADDI r1, 1
    STORE r20, r1

    ; Update checkpoint
    LDI r20, DEBUG_CHECKPOINT
    LDI r1, beat_loop
    STORE r20, r1

    ; Decrement counter
    SUBI r4, 1
    CMPI r4, 0
    JZ r1, crash_now
    JMP beat_loop

crash_now:
    ; Simulate a crash: just halt (no more FRAME, no more heartbeat updates)
    ; Draw a red X to show we're "dead"
    LDI r1, 0xFF0000
    LDI r13, 50
    LDI r14, 50
    LDI r15, 50
    LDI r9, 50
    RECTF r13, r14, r15, r9, r1

dead_loop:
    ; Infinite loop with no FRAME -- the heartbeat stops updating
    JMP dead_loop
