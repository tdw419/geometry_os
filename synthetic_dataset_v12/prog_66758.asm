; DESCRIPTION: Renders a blue box of size 114x119 starting at (197, 90).
; PLAN: r0=197(x), r1=90(y), r2=114(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 90
LDI r2, 114
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
