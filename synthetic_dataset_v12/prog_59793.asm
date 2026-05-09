; DESCRIPTION: Draws a white line from (169, 19) to (29, 3).
; PLAN: r0=169(x1), r1=19(y1), r2=29(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 19
LDI r2, 29
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
