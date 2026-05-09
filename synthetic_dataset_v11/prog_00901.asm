; DESCRIPTION: Draws a white line from (185, 140) to (211, 14).
; PLAN: r0=185(x1), r1=140(y1), r2=211(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 140
LDI r2, 211
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
