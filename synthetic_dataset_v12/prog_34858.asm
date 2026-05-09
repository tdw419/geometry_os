; DESCRIPTION: Draws a magenta line from (250, 161) to (165, 5).
; PLAN: r0=250(x1), r1=161(y1), r2=165(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 161
LDI r2, 165
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
