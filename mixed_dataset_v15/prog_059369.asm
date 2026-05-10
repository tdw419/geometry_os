; DESCRIPTION: Places a white line segment connecting (370, 119) to (8, 23).
; PLAN: r0=370(x1), r1=119(y1), r2=8(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 119
LDI r2, 8
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
