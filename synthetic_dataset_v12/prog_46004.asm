; DESCRIPTION: Places a blue 78x58 rectangle at position (11, 2).
; PLAN: r0=11(x), r1=2(y), r2=78(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 2
LDI r2, 78
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
