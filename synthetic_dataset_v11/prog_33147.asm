; DESCRIPTION: Renders a blue box of size 15x69 starting at (110, 114).
; PLAN: r0=110(x), r1=114(y), r2=15(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 114
LDI r2, 15
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
