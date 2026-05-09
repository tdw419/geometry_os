; DESCRIPTION: Renders a magenta line between points (234, 127) and (266, 181).
; PLAN: r0=234(x1), r1=127(y1), r2=266(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 127
LDI r2, 266
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
