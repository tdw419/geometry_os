; DESCRIPTION: Places a white line segment connecting (55, 81) to (270, 251).
; PLAN: r0=55(x1), r1=81(y1), r2=270(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 81
LDI r2, 270
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
