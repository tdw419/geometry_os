; DESCRIPTION: Draws a magenta line from (181, 172) to (91, 109).
; PLAN: r0=181(x1), r1=172(y1), r2=91(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 172
LDI r2, 91
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
