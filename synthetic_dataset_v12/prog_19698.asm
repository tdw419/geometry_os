; DESCRIPTION: Draws a magenta line from (308, 167) to (184, 130).
; PLAN: r0=308(x1), r1=167(y1), r2=184(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 167
LDI r2, 184
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
