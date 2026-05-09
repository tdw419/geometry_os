; DESCRIPTION: Places a white line segment connecting (26, 129) to (222, 179).
; PLAN: r0=26(x1), r1=129(y1), r2=222(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 129
LDI r2, 222
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
