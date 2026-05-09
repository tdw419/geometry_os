; DESCRIPTION: Composite: . Then Creates a orange circular shape at (81, 65) with radius 45. Then Places a purple dot at position (23, 48).
; PLAN: r0=81(x), r1=65(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange circular shape at (81, 65) with radius 45.
; PLAN: r0=81(x), r1=65(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 65
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (23, 48).
; PLAN: r0=23(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 48
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
