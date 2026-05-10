; DESCRIPTION: Renders a white box of size 100x69 starting at (155, 138).
; PLAN: r0=155(x), r1=138(y), r2=100(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 138
LDI r2, 100
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
