; DESCRIPTION: Renders a green line between points (321, 106) and (254, 144).
; PLAN: r0=321(x1), r1=106(y1), r2=254(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 106
LDI r2, 254
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
