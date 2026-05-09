; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (155, 137) with radius 33. Then Sets a single green pixel at (219, 68).
; PLAN: r0=155(x), r1=137(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=219(x), r1=68(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow circle centered at (155, 137) with radius 33.
; PLAN: r0=155(x), r1=137(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 137
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (219, 68).
; PLAN: r0=219(x), r1=68(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 68
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
