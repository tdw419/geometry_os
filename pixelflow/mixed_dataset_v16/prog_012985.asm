; DESCRIPTION: Places a black line segment connecting (13, 161) to (277, 144).
; PLAN: r0=13(x1), r1=161(y1), r2=277(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 161
LDI r2, 277
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
