; DESCRIPTION: Draws a yellow line from (12, 118) to (329, 251).
; PLAN: r0=12(x1), r1=118(y1), r2=329(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 118
LDI r2, 329
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
