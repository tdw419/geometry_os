; DESCRIPTION: Composite: . Then Places a white dot at position (6, 100). Then Draws a orange circle centered at (128, 85) with radius 39.
; PLAN: r0=6(x), r1=100(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=128(x), r1=85(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (6, 100).
; PLAN: r0=6(x), r1=100(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 100
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange circle centered at (128, 85) with radius 39.
; PLAN: r0=128(x), r1=85(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 85
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
