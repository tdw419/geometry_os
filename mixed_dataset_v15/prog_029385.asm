; DESCRIPTION: Draws a red line from (104, 44) to (413, 105).
; PLAN: r0=104(x1), r1=44(y1), r2=413(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 44
LDI r2, 413
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
