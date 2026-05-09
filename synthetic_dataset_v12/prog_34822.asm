; DESCRIPTION: Draws a white line from (83, 23) to (359, 147).
; PLAN: r0=83(x1), r1=23(y1), r2=359(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 23
LDI r2, 359
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
