; DESCRIPTION: Renders a magenta line segment connecting (358, 192) to (347, 63).
; PLAN: r0=358(x1), r1=192(y1), r2=347(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 192
LDI r2, 347
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
