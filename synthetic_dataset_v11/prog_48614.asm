; DESCRIPTION: Renders a blue box of size 26x23 starting at (17, 211).
; PLAN: r0=17(x), r1=211(y), r2=26(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 211
LDI r2, 26
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
