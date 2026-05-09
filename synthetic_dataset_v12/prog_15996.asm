; DESCRIPTION: Draws a black line from (277, 200) to (222, 130).
; PLAN: r0=277(x1), r1=200(y1), r2=222(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 200
LDI r2, 222
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
