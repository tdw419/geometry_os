; DESCRIPTION: Draws a magenta line from (237, 17) to (29, 194).
; PLAN: r0=237(x1), r1=17(y1), r2=29(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 17
LDI r2, 29
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
