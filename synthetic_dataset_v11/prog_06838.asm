; DESCRIPTION: Composite: . Then Places a blue dot at position (122, 118). Then Draws a purple line from (254, 233) to (251, 130).
; PLAN: r0=122(x), r1=118(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=254(x1), r1=233(y1), r2=251(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (122, 118).
; PLAN: r0=122(x), r1=118(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 118
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (254, 233) to (251, 130).
; PLAN: r0=254(x1), r1=233(y1), r2=251(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 233
LDI r2, 251
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
