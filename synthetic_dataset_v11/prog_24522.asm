; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (181, 130) with radius 56. Then Places a white dot at position (229, 110).
; PLAN: r0=181(x), r1=130(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=229(x), r1=110(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow circle centered at (181, 130) with radius 56.
; PLAN: r0=181(x), r1=130(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 130
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (229, 110).
; PLAN: r0=229(x), r1=110(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 110
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
