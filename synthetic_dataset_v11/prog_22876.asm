; DESCRIPTION: Composite: . Then Places a blue dot at position (137, 44). Then Draws a yellow circle centered at (75, 40) with radius 31.
; PLAN: r0=137(x), r1=44(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=75(x), r1=40(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (137, 44).
; PLAN: r0=137(x), r1=44(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 44
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow circle centered at (75, 40) with radius 31.
; PLAN: r0=75(x), r1=40(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 40
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
