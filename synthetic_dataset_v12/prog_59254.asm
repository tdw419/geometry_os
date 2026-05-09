; DESCRIPTION: Draws a magenta line from (99, 103) to (85, 70).
; PLAN: r0=99(x1), r1=103(y1), r2=85(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 103
LDI r2, 85
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
