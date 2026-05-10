; DESCRIPTION: Renders a green line segment connecting (169, 17) to (272, 38).
; PLAN: r0=169(x1), r1=17(y1), r2=272(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 17
LDI r2, 272
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
