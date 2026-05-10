; DESCRIPTION: Draws a red line from (379, 52) to (51, 172).
; PLAN: r0=379(x1), r1=52(y1), r2=51(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 52
LDI r2, 51
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
