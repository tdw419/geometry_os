; DESCRIPTION: Renders a blue box of size 20x49 starting at (141, 160).
; PLAN: r0=141(x), r1=160(y), r2=20(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 160
LDI r2, 20
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
