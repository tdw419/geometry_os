; DESCRIPTION: Renders a magenta line between points (236, 5) and (432, 194).
; PLAN: r0=236(x1), r1=5(y1), r2=432(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 5
LDI r2, 432
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
