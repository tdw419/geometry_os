; DESCRIPTION: Draws a white line from (177, 137) to (342, 10).
; PLAN: r0=177(x1), r1=137(y1), r2=342(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 137
LDI r2, 342
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
