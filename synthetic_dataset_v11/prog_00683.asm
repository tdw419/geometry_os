; DESCRIPTION: Draws a white line from (251, 169) to (91, 223).
; PLAN: r0=251(x1), r1=169(y1), r2=91(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 169
LDI r2, 91
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
