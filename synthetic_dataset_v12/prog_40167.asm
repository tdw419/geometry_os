; DESCRIPTION: Renders a blue box of size 26x102 starting at (283, 35).
; PLAN: r0=283(x), r1=35(y), r2=26(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 35
LDI r2, 26
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
