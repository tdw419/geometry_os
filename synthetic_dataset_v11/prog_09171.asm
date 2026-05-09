; DESCRIPTION: Places a green line segment connecting (110, 142) to (154, 94).
; PLAN: r0=110(x1), r1=142(y1), r2=154(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 142
LDI r2, 154
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
