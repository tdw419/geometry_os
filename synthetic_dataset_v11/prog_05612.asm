; DESCRIPTION: Composite: . Then Places a purple dot at position (194, 17). Then Draws a yellow line from (147, 118) to (221, 23).
; PLAN: r0=194(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=147(x1), r1=118(y1), r2=221(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (194, 17).
; PLAN: r0=194(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 17
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (147, 118) to (221, 23).
; PLAN: r0=147(x1), r1=118(y1), r2=221(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 118
LDI r2, 221
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
