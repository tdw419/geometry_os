; DESCRIPTION: Draws a red line from (140, 236) to (169, 237).
; PLAN: r0=140(x1), r1=236(y1), r2=169(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 236
LDI r2, 169
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
