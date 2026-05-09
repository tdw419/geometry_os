; DESCRIPTION: Renders a blue box of size 96x31 starting at (8, 3).
; PLAN: r0=8(x), r1=3(y), r2=96(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 3
LDI r2, 96
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
