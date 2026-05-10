; DESCRIPTION: Renders a yellow line segment connecting (65, 159) to (331, 95).
; PLAN: r0=65(x1), r1=159(y1), r2=331(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 159
LDI r2, 331
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
