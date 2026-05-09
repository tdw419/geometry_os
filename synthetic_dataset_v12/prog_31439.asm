; DESCRIPTION: Draws a yellow line from (170, 251) to (185, 60).
; PLAN: r0=170(x1), r1=251(y1), r2=185(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 251
LDI r2, 185
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
