; DESCRIPTION: Renders a blue box of size 100x99 starting at (411, 65).
; PLAN: r0=411(x), r1=65(y), r2=100(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 65
LDI r2, 100
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
