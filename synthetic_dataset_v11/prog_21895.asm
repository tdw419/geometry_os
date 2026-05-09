; DESCRIPTION: Composite: . Then Draws a purple line from (192, 166) to (75, 175). Then Places a yellow dot at position (226, 229).
; PLAN: r0=192(x1), r1=166(y1), r2=75(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=226(x), r1=229(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (192, 166) to (75, 175).
; PLAN: r0=192(x1), r1=166(y1), r2=75(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 166
LDI r2, 75
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (226, 229).
; PLAN: r0=226(x), r1=229(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 229
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
