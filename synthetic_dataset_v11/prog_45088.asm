; DESCRIPTION: Draws a magenta line from (83, 81) to (196, 85).
; PLAN: r0=83(x1), r1=81(y1), r2=196(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 81
LDI r2, 196
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
