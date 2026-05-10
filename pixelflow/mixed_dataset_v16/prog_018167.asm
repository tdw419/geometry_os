; DESCRIPTION: Draws a white line from (134, 169) to (204, 154).
; PLAN: r0=134(x1), r1=169(y1), r2=204(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 169
LDI r2, 204
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
