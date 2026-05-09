; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (74, 185) with radius 10. Then Places a orange dot at position (111, 90).
; PLAN: r0=74(x), r1=185(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=111(x), r1=90(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow circle centered at (74, 185) with radius 10.
; PLAN: r0=74(x), r1=185(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 185
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (111, 90).
; PLAN: r0=111(x), r1=90(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 90
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
