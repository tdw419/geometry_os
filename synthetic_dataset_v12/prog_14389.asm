; DESCRIPTION: Draws a magenta line from (217, 155) to (461, 48).
; PLAN: r0=217(x1), r1=155(y1), r2=461(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 155
LDI r2, 461
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
