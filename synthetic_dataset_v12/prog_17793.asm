; DESCRIPTION: Draws a red line from (379, 211) to (52, 196).
; PLAN: r0=379(x1), r1=211(y1), r2=52(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 211
LDI r2, 52
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
