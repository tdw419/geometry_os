; DESCRIPTION: Draws a red line from (154, 137) to (311, 232).
; PLAN: r0=154(x1), r1=137(y1), r2=311(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 137
LDI r2, 311
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
