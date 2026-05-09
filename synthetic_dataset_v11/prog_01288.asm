; DESCRIPTION: Renders a blue line between points (111, 65) and (66, 144).
; PLAN: r0=111(x1), r1=65(y1), r2=66(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 65
LDI r2, 66
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
