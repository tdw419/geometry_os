; DESCRIPTION: Renders a white line between points (419, 54) and (417, 250).
; PLAN: r0=419(x1), r1=54(y1), r2=417(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 54
LDI r2, 417
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
