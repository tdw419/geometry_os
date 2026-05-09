; DESCRIPTION: Composite: . Then Draws a green circle centered at (186, 153) with radius 20. Then Places a blue dot at position (3, 183).
; PLAN: r0=186(x), r1=153(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=3(x), r1=183(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green circle centered at (186, 153) with radius 20.
; PLAN: r0=186(x), r1=153(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 153
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (3, 183).
; PLAN: r0=3(x), r1=183(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 183
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
