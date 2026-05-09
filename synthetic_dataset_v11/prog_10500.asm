; DESCRIPTION: Draws a magenta line from (109, 189) to (236, 223).
; PLAN: r0=109(x1), r1=189(y1), r2=236(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 189
LDI r2, 236
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
