; DESCRIPTION: Draws a red line from (497, 192) to (448, 162).
; PLAN: r0=497(x1), r1=192(y1), r2=448(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 192
LDI r2, 448
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
