; DESCRIPTION: Draws a magenta line from (152, 243) to (505, 112).
; PLAN: r0=152(x1), r1=243(y1), r2=505(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 243
LDI r2, 505
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
