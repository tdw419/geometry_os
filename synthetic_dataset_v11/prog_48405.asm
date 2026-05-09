; DESCRIPTION: Draws a magenta line from (184, 38) to (31, 189).
; PLAN: r0=184(x1), r1=38(y1), r2=31(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 38
LDI r2, 31
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
