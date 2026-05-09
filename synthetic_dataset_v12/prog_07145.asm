; DESCRIPTION: Renders a white line between points (419, 110) and (462, 39).
; PLAN: r0=419(x1), r1=110(y1), r2=462(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 110
LDI r2, 462
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
