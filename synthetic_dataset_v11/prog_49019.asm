; DESCRIPTION: Draws a magenta line from (129, 226) to (81, 72).
; PLAN: r0=129(x1), r1=226(y1), r2=81(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 226
LDI r2, 81
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
