; DESCRIPTION: Draws a red line from (294, 89) to (331, 169).
; PLAN: r0=294(x1), r1=89(y1), r2=331(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 89
LDI r2, 331
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
