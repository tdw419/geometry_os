; DESCRIPTION: Renders a magenta line between points (362, 99) and (184, 185).
; PLAN: r0=362(x1), r1=99(y1), r2=184(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 99
LDI r2, 184
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
