; DESCRIPTION: Places a white line segment connecting (270, 243) to (179, 35).
; PLAN: r0=270(x1), r1=243(y1), r2=179(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 243
LDI r2, 179
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
