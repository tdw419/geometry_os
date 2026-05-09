; DESCRIPTION: Renders a magenta line between points (196, 63) and (414, 135).
; PLAN: r0=196(x1), r1=63(y1), r2=414(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 63
LDI r2, 414
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
