; DESCRIPTION: Composite: . Then Draws a magenta line from (83, 236) to (65, 253). Then Draws a blue circle centered at (159, 170) with radius 77.
; PLAN: r0=83(x1), r1=236(y1), r2=65(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=159(x), r1=170(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (83, 236) to (65, 253).
; PLAN: r0=83(x1), r1=236(y1), r2=65(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 236
LDI r2, 65
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (159, 170) with radius 77.
; PLAN: r0=159(x), r1=170(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 170
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
