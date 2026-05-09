; DESCRIPTION: Places a white line segment connecting (21, 130) to (144, 11).
; PLAN: r0=21(x1), r1=130(y1), r2=144(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 130
LDI r2, 144
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
