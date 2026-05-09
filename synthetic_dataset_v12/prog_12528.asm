; DESCRIPTION: Places a white line segment connecting (430, 130) to (110, 34).
; PLAN: r0=430(x1), r1=130(y1), r2=110(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 130
LDI r2, 110
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
