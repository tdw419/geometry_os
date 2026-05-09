; DESCRIPTION: Draws a magenta line from (99, 6) to (134, 152).
; PLAN: r0=99(x1), r1=6(y1), r2=134(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 6
LDI r2, 134
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
