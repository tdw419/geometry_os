; DESCRIPTION: Draws a yellow line from (83, 200) to (220, 189).
; PLAN: r0=83(x1), r1=200(y1), r2=220(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 200
LDI r2, 220
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
