; DESCRIPTION: Draws a yellow line from (199, 112) to (140, 104).
; PLAN: r0=199(x1), r1=112(y1), r2=140(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 112
LDI r2, 140
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
