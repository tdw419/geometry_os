; DESCRIPTION: Draws a magenta line from (84, 96) to (211, 161).
; PLAN: r0=84(x1), r1=96(y1), r2=211(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 96
LDI r2, 211
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
