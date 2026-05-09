; DESCRIPTION: Renders a magenta line between points (158, 232) and (356, 86).
; PLAN: r0=158(x1), r1=232(y1), r2=356(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 232
LDI r2, 356
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
