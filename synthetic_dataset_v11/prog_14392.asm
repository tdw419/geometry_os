; DESCRIPTION: Composite: . Then Places a yellow dot at position (119, 180). Then Draws a purple line from (111, 177) to (185, 62).
; PLAN: r0=119(x), r1=180(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=111(x1), r1=177(y1), r2=185(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (119, 180).
; PLAN: r0=119(x), r1=180(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 180
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (111, 177) to (185, 62).
; PLAN: r0=111(x1), r1=177(y1), r2=185(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 177
LDI r2, 185
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
