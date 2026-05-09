; DESCRIPTION: Draws a white line from (155, 22) to (221, 0).
; PLAN: r0=155(x1), r1=22(y1), r2=221(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 22
LDI r2, 221
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
