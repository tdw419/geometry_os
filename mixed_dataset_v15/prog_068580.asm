; DESCRIPTION: Draws a magenta line from (163, 125) to (1, 160).
; PLAN: r0=163(x1), r1=125(y1), r2=1(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 125
LDI r2, 1
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
