; DESCRIPTION: Draws a magenta line from (227, 164) to (186, 100).
; PLAN: r0=227(x1), r1=164(y1), r2=186(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 164
LDI r2, 186
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
