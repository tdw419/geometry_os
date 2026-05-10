; DESCRIPTION: Draws a red line from (463, 251) to (199, 253).
; PLAN: r0=463(x1), r1=251(y1), r2=199(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 251
LDI r2, 199
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
