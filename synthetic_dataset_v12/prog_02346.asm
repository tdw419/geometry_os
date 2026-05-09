; DESCRIPTION: Renders a green box of size 26x69 starting at (155, 117).
; PLAN: r0=155(x), r1=117(y), r2=26(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 117
LDI r2, 26
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
