; DESCRIPTION: Renders a yellow line between points (145, 84) and (16, 63).
; PLAN: r0=145(x1), r1=84(y1), r2=16(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 84
LDI r2, 16
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
