; DESCRIPTION: Draws a white line from (169, 160) to (189, 55).
; PLAN: r0=169(x1), r1=160(y1), r2=189(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 160
LDI r2, 189
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
