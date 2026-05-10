; DESCRIPTION: Renders a yellow line between points (300, 209) and (396, 205).
; PLAN: r0=300(x1), r1=209(y1), r2=396(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 209
LDI r2, 396
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
