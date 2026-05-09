; DESCRIPTION: Places a white line segment connecting (419, 41) to (270, 35).
; PLAN: r0=419(x1), r1=41(y1), r2=270(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 41
LDI r2, 270
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
