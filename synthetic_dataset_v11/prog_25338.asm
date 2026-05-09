; DESCRIPTION: Composite: . Then Sets a single blue pixel at (71, 225). Then Draws a orange line from (175, 136) to (5, 144).
; PLAN: r0=71(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=175(x1), r1=136(y1), r2=5(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (71, 225).
; PLAN: r0=71(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 225
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (175, 136) to (5, 144).
; PLAN: r0=175(x1), r1=136(y1), r2=5(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 136
LDI r2, 5
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
