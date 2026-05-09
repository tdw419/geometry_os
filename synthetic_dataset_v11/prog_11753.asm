; DESCRIPTION: Composite: . Then Places a orange dot at position (105, 38). Then Draws a black circle centered at (90, 188) with radius 45.
; PLAN: r0=105(x), r1=38(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=90(x), r1=188(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (105, 38).
; PLAN: r0=105(x), r1=38(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 38
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (90, 188) with radius 45.
; PLAN: r0=90(x), r1=188(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 188
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
