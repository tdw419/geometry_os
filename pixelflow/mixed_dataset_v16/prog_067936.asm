; DESCRIPTION: Draws a white line from (229, 77) to (12, 169).
; PLAN: r0=229(x1), r1=77(y1), r2=12(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 77
LDI r2, 12
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
