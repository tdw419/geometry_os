; DESCRIPTION: Renders a white line between points (120, 80) and (110, 251).
; PLAN: r0=120(x1), r1=80(y1), r2=110(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 80
LDI r2, 110
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
