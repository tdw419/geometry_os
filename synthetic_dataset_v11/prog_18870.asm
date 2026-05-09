; DESCRIPTION: Draws a red line from (234, 222) to (136, 169).
; PLAN: r0=234(x1), r1=222(y1), r2=136(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 222
LDI r2, 136
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
