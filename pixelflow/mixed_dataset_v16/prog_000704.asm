; DESCRIPTION: Renders a green line segment connecting (302, 7) to (321, 157).
; PLAN: r0=302(x1), r1=7(y1), r2=321(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 7
LDI r2, 321
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
