; DESCRIPTION: Renders a green line segment connecting (248, 143) to (191, 159).
; PLAN: r0=248(x1), r1=143(y1), r2=191(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 143
LDI r2, 191
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
