; DESCRIPTION: Renders a purple line segment connecting (196, 127) to (367, 144).
; PLAN: r0=196(x1), r1=127(y1), r2=367(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 127
LDI r2, 367
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
