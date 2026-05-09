; DESCRIPTION: Draws a magenta line from (184, 169) to (286, 7).
; PLAN: r0=184(x1), r1=169(y1), r2=286(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 169
LDI r2, 286
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
