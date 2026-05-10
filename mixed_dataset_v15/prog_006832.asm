; DESCRIPTION: Renders a green line between points (63, 145) and (19, 144).
; PLAN: r0=63(x1), r1=145(y1), r2=19(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 145
LDI r2, 19
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
