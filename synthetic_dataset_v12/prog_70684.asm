; DESCRIPTION: Renders a blue box of size 35x100 starting at (250, 58).
; PLAN: r0=250(x), r1=58(y), r2=35(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 58
LDI r2, 35
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
