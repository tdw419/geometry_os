; DESCRIPTION: Draws a magenta line from (106, 159) to (95, 244).
; PLAN: r0=106(x1), r1=159(y1), r2=95(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 159
LDI r2, 95
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
