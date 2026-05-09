; DESCRIPTION: Draws a magenta line from (191, 250) to (138, 250).
; PLAN: r0=191(x1), r1=250(y1), r2=138(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 250
LDI r2, 138
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
