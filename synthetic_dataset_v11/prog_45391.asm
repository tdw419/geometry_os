; DESCRIPTION: Draws a magenta line from (211, 24) to (133, 138).
; PLAN: r0=211(x1), r1=24(y1), r2=133(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 24
LDI r2, 133
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
