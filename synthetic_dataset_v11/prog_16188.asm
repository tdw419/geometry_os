; DESCRIPTION: Renders a blue box of size 81x108 starting at (115, 65).
; PLAN: r0=115(x), r1=65(y), r2=81(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 65
LDI r2, 81
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
