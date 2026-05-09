; DESCRIPTION: Draws a blue line from (189, 137) to (210, 169).
; PLAN: r0=189(x1), r1=137(y1), r2=210(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 137
LDI r2, 210
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
