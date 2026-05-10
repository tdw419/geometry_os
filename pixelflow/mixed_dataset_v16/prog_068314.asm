; DESCRIPTION: Renders a blue box of size 59x69 starting at (318, 102).
; PLAN: r0=318(x), r1=102(y), r2=59(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 102
LDI r2, 59
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
