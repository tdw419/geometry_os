; DESCRIPTION: Renders a blue box of size 26x112 starting at (75, 70).
; PLAN: r0=75(x), r1=70(y), r2=26(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 70
LDI r2, 26
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
