; DESCRIPTION: Renders a white line segment connecting (207, 110) to (128, 7).
; PLAN: r0=207(x1), r1=110(y1), r2=128(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 110
LDI r2, 128
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
