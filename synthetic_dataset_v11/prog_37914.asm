; DESCRIPTION: Draws a magenta line from (137, 142) to (26, 60).
; PLAN: r0=137(x1), r1=142(y1), r2=26(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 142
LDI r2, 26
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
