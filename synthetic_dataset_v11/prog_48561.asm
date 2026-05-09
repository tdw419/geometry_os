; DESCRIPTION: Composite: . Then Draws a purple line from (65, 188) to (253, 26). Then Sets a single orange pixel at (33, 155).
; PLAN: r0=65(x1), r1=188(y1), r2=253(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=33(x), r1=155(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (65, 188) to (253, 26).
; PLAN: r0=65(x1), r1=188(y1), r2=253(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 188
LDI r2, 253
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (33, 155).
; PLAN: r0=33(x), r1=155(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 155
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
