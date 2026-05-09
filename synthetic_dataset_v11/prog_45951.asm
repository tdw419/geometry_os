; DESCRIPTION: Places a green line segment connecting (251, 54) to (14, 189).
; PLAN: r0=251(x1), r1=54(y1), r2=14(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 54
LDI r2, 14
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
