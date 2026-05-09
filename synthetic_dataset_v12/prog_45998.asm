; DESCRIPTION: Places a cyan 25x60 rectangle at position (284, 92).
; PLAN: r0=284(x), r1=92(y), r2=25(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 92
LDI r2, 25
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
