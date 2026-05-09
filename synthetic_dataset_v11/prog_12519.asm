; DESCRIPTION: Composite: . Then Places a blue dot at position (83, 2). Then Draws a green circle centered at (195, 154) with radius 16.
; PLAN: r0=83(x), r1=2(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=195(x), r1=154(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (83, 2).
; PLAN: r0=83(x), r1=2(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 2
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a green circle centered at (195, 154) with radius 16.
; PLAN: r0=195(x), r1=154(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 154
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
