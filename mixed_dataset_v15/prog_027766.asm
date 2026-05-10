; DESCRIPTION: Renders a yellow line between points (447, 86) and (229, 3).
; PLAN: r0=447(x1), r1=86(y1), r2=229(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 86
LDI r2, 229
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
