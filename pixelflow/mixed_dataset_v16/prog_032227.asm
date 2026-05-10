; DESCRIPTION: Draws a green line from (300, 169) to (79, 187).
; PLAN: r0=300(x1), r1=169(y1), r2=79(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 169
LDI r2, 79
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
