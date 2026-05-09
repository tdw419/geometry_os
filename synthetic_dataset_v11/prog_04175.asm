; DESCRIPTION: Renders a yellow line between points (229, 27) and (24, 110).
; PLAN: r0=229(x1), r1=27(y1), r2=24(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 27
LDI r2, 24
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
