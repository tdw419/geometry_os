; DESCRIPTION: Renders a blue box of size 99x31 starting at (122, 69).
; PLAN: r0=122(x), r1=69(y), r2=99(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 69
LDI r2, 99
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
