; DESCRIPTION: Draws a magenta line from (498, 54) to (489, 237).
; PLAN: r0=498(x1), r1=54(y1), r2=489(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 54
LDI r2, 489
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
