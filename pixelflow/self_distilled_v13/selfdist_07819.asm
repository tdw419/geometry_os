; DESCRIPTION: Renders a yellow line segment connecting (272, 113) to (241, 142).
; PLAN: r0=272(x1), r1=113(y1), r2=241(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 113
LDI r2, 241
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
