; DESCRIPTION: Renders a magenta line between points (148, 144) and (64, 185).
; PLAN: r0=148(x1), r1=144(y1), r2=64(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 144
LDI r2, 64
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
