; DESCRIPTION: Draws a red line from (164, 247) to (227, 137).
; PLAN: r0=164(x1), r1=247(y1), r2=227(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 247
LDI r2, 227
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
