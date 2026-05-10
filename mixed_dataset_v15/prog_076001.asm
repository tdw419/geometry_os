; DESCRIPTION: Draws a red line from (186, 234) to (55, 177).
; PLAN: r0=186(x1), r1=234(y1), r2=55(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 234
LDI r2, 55
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
