; DESCRIPTION: Places a white line segment connecting (192, 205) to (430, 99).
; PLAN: r0=192(x1), r1=205(y1), r2=430(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 205
LDI r2, 430
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
