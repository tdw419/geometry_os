; DESCRIPTION: Places a white line segment connecting (130, 154) to (448, 80).
; PLAN: r0=130(x1), r1=154(y1), r2=448(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 154
LDI r2, 448
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
