; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (196, 76) with radius 40. Then Places a orange dot at position (194, 39).
; PLAN: r0=196(x), r1=76(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=194(x), r1=39(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (196, 76) with radius 40.
; PLAN: r0=196(x), r1=76(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 76
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (194, 39).
; PLAN: r0=194(x), r1=39(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 39
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
