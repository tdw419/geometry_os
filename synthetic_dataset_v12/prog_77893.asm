; DESCRIPTION: Renders a yellow box of size 26x69 starting at (55, 132).
; PLAN: r0=55(x), r1=132(y), r2=26(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 132
LDI r2, 26
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
