; DESCRIPTION: Composite: . Then Draws a black circle centered at (145, 88) with radius 68. Then Sets a single green pixel at (125, 193).
; PLAN: r0=145(x), r1=88(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=125(x), r1=193(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black circle centered at (145, 88) with radius 68.
; PLAN: r0=145(x), r1=88(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 88
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (125, 193).
; PLAN: r0=125(x), r1=193(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 193
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
