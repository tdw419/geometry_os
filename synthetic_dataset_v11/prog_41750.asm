; DESCRIPTION: Places a white line segment connecting (85, 37) to (110, 225).
; PLAN: r0=85(x1), r1=37(y1), r2=110(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 37
LDI r2, 110
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
