; DESCRIPTION: Composite: . Then Places a yellow circle of radius 20 at center (129, 159). Then Places a orange dot at position (179, 69).
; PLAN: r0=129(x), r1=159(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=179(x), r1=69(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 20 at center (129, 159).
; PLAN: r0=129(x), r1=159(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 159
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (179, 69).
; PLAN: r0=179(x), r1=69(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 69
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
