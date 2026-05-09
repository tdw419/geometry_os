; DESCRIPTION: Renders a blue box of size 106x108 starting at (7, 105).
; PLAN: r0=7(x), r1=105(y), r2=106(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 105
LDI r2, 106
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
