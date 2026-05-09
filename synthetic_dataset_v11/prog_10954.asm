; DESCRIPTION: Renders a blue box of size 35x114 starting at (23, 87).
; PLAN: r0=23(x), r1=87(y), r2=35(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 87
LDI r2, 35
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
