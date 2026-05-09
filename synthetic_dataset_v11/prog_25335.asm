; DESCRIPTION: Draws a white line from (38, 232) to (185, 61).
; PLAN: r0=38(x1), r1=232(y1), r2=185(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 232
LDI r2, 185
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
