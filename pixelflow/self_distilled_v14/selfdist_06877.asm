; DESCRIPTION: Draws a magenta line from (6, 31) to (164, 136).
; PLAN: r0=6(x1), r1=31(y1), r2=164(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 31
LDI r2, 164
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
