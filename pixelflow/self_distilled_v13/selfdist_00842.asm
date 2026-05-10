; DESCRIPTION: Renders a white line segment connecting (326, 66) to (364, 12).
; PLAN: r0=326(x1), r1=66(y1), r2=364(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 66
LDI r2, 364
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
