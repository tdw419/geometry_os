; DESCRIPTION: Draws a green line from (251, 169) to (8, 161).
; PLAN: r0=251(x1), r1=169(y1), r2=8(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 169
LDI r2, 8
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
