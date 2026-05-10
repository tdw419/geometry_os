; DESCRIPTION: Draws a black line from (144, 153) to (199, 217).
; PLAN: r0=144(x1), r1=153(y1), r2=199(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 153
LDI r2, 199
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
