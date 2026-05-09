; DESCRIPTION: Renders a blue box of size 26x55 starting at (3, 75).
; PLAN: r0=3(x), r1=75(y), r2=26(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 75
LDI r2, 26
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
