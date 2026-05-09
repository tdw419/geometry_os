; DESCRIPTION: Draws a red line from (415, 20) to (201, 232).
; PLAN: r0=415(x1), r1=20(y1), r2=201(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 20
LDI r2, 201
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
