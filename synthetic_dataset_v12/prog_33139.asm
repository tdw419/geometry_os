; DESCRIPTION: Renders a blue box of size 64x78 starting at (58, 31).
; PLAN: r0=58(x), r1=31(y), r2=64(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 31
LDI r2, 64
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
