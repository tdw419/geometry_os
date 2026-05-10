; DESCRIPTION: Renders a white line segment connecting (210, 66) to (14, 45).
; PLAN: r0=210(x1), r1=66(y1), r2=14(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 66
LDI r2, 14
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
