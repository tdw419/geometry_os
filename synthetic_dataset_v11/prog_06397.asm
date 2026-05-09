; DESCRIPTION: Composite: . Then Draws a red circle centered at (110, 54) with radius 44. Then Places a green dot at position (93, 147).
; PLAN: r0=110(x), r1=54(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=93(x), r1=147(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red circle centered at (110, 54) with radius 44.
; PLAN: r0=110(x), r1=54(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 54
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (93, 147).
; PLAN: r0=93(x), r1=147(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 147
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
