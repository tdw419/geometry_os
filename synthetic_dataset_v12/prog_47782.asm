; DESCRIPTION: Renders a blue box of size 44x114 starting at (153, 84).
; PLAN: r0=153(x), r1=84(y), r2=44(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 84
LDI r2, 44
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
