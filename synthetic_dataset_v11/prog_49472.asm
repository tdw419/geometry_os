; DESCRIPTION: Draws a magenta line from (136, 64) to (54, 140).
; PLAN: r0=136(x1), r1=64(y1), r2=54(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 64
LDI r2, 54
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
