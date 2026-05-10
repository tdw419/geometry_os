; DESCRIPTION: Renders a green box of size 60x69 starting at (378, 106).
; PLAN: r0=378(x), r1=106(y), r2=60(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 106
LDI r2, 60
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
