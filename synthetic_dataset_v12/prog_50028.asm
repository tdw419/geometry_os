; DESCRIPTION: Draws a green line from (9, 118) to (306, 247).
; PLAN: r0=9(x1), r1=118(y1), r2=306(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 118
LDI r2, 306
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
