; DESCRIPTION: Renders a green box of size 96x69 starting at (134, 140).
; PLAN: r0=134(x), r1=140(y), r2=96(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 140
LDI r2, 96
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
