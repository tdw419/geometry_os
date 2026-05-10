; DESCRIPTION: Renders a green line segment connecting (107, 38) to (229, 11).
; PLAN: r0=107(x1), r1=38(y1), r2=229(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 38
LDI r2, 229
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
