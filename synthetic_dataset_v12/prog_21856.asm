; DESCRIPTION: Renders a blue box of size 45x29 starting at (311, 64).
; PLAN: r0=311(x), r1=64(y), r2=45(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 64
LDI r2, 45
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
