; DESCRIPTION: Draws a red line from (448, 253) to (447, 13).
; PLAN: r0=448(x1), r1=253(y1), r2=447(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 253
LDI r2, 447
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
