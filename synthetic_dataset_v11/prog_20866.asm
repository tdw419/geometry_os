; DESCRIPTION: Draws a red line from (78, 211) to (104, 105).
; PLAN: r0=78(x1), r1=211(y1), r2=104(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 211
LDI r2, 104
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
