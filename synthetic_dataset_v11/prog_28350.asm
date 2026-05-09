; DESCRIPTION: Composite: . Then Renders a yellow box of size 12x13 starting at (201, 181). Then Sets a single orange pixel at (32, 78).
; PLAN: r0=201(x), r1=181(y), r2=12(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=32(x), r1=78(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 12x13 starting at (201, 181).
; PLAN: r0=201(x), r1=181(y), r2=12(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 181
LDI r2, 12
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (32, 78).
; PLAN: r0=32(x), r1=78(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 78
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
