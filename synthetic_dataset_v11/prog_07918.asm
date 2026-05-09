; DESCRIPTION: Composite: . Then Creates a orange circular shape at (149, 91) with radius 69. Then Places a blue dot at position (158, 71).
; PLAN: r0=149(x), r1=91(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=158(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange circular shape at (149, 91) with radius 69.
; PLAN: r0=149(x), r1=91(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 91
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (158, 71).
; PLAN: r0=158(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 71
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
