; DESCRIPTION: Draws a magenta line from (196, 181) to (125, 100).
; PLAN: r0=196(x1), r1=181(y1), r2=125(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 181
LDI r2, 125
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
