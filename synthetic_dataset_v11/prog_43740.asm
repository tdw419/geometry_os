; DESCRIPTION: Draws a white line from (249, 189) to (211, 153).
; PLAN: r0=249(x1), r1=189(y1), r2=211(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 189
LDI r2, 211
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
