; DESCRIPTION: Places a green line segment connecting (256, 129) to (484, 130).
; PLAN: r0=256(x1), r1=129(y1), r2=484(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 129
LDI r2, 484
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
