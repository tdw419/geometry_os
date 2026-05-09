; DESCRIPTION: Renders a magenta line between points (408, 11) and (336, 137).
; PLAN: r0=408(x1), r1=11(y1), r2=336(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 11
LDI r2, 336
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
