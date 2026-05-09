; DESCRIPTION: Places a black 75x67 rectangle at position (137, 64).
; PLAN: r0=137(x), r1=64(y), r2=75(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 64
LDI r2, 75
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
