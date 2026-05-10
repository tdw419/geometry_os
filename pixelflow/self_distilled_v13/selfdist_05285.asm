; DESCRIPTION: Renders a green line segment connecting (334, 194) to (16, 54).
; PLAN: r0=334(x1), r1=194(y1), r2=16(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 194
LDI r2, 16
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
