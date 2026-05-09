; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (229, 43) with radius 17. Then Places a white dot at position (40, 66).
; PLAN: r0=229(x), r1=43(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=40(x), r1=66(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow circle centered at (229, 43) with radius 17.
; PLAN: r0=229(x), r1=43(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 43
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (40, 66).
; PLAN: r0=40(x), r1=66(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 66
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
