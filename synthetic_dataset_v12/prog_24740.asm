; DESCRIPTION: Draws a yellow line from (51, 170) to (439, 104).
; PLAN: r0=51(x1), r1=170(y1), r2=439(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 170
LDI r2, 439
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
