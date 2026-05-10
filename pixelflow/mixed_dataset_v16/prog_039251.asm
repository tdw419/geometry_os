; DESCRIPTION: Places a green line segment connecting (86, 129) to (351, 81).
; PLAN: r0=86(x1), r1=129(y1), r2=351(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 129
LDI r2, 351
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
