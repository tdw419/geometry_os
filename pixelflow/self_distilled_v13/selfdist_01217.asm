; DESCRIPTION: Renders a yellow line segment connecting (342, 144) to (96, 45).
; PLAN: r0=342(x1), r1=144(y1), r2=96(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 144
LDI r2, 96
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
