; DESCRIPTION: Renders a yellow line between points (318, 79) and (196, 193).
; PLAN: r0=318(x1), r1=79(y1), r2=196(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 79
LDI r2, 196
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
