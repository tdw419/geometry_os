; DESCRIPTION: Draws a magenta line from (328, 155) to (384, 247).
; PLAN: r0=328(x1), r1=155(y1), r2=384(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 155
LDI r2, 384
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
