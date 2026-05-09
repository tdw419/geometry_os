; DESCRIPTION: Renders a white line between points (8, 75) and (283, 251).
; PLAN: r0=8(x1), r1=75(y1), r2=283(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 75
LDI r2, 283
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
