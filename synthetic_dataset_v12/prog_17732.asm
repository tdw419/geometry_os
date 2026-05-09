; DESCRIPTION: Places a white line segment connecting (154, 130) to (24, 130).
; PLAN: r0=154(x1), r1=130(y1), r2=24(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 130
LDI r2, 24
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
