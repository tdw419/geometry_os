; DESCRIPTION: Renders a green line between points (282, 17) and (273, 144).
; PLAN: r0=282(x1), r1=17(y1), r2=273(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 17
LDI r2, 273
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
