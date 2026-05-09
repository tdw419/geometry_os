; DESCRIPTION: Renders a blue box of size 112x81 starting at (44, 23).
; PLAN: r0=44(x), r1=23(y), r2=112(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 23
LDI r2, 112
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
