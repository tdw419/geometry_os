; DESCRIPTION: Renders a blue box of size 48x81 starting at (141, 99).
; PLAN: r0=141(x), r1=99(y), r2=48(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 99
LDI r2, 48
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
