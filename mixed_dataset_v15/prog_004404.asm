; DESCRIPTION: Places a white line segment connecting (110, 225) to (419, 187).
; PLAN: r0=110(x1), r1=225(y1), r2=419(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 225
LDI r2, 419
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
