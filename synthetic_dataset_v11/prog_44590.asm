; DESCRIPTION: Renders a blue box of size 36x69 starting at (13, 122).
; PLAN: r0=13(x), r1=122(y), r2=36(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 122
LDI r2, 36
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
