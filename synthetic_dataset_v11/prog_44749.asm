; DESCRIPTION: Draws a magenta line from (78, 93) to (80, 63).
; PLAN: r0=78(x1), r1=93(y1), r2=80(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 93
LDI r2, 80
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
