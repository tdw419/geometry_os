; DESCRIPTION: Draws a magenta line from (7, 78) to (132, 132).
; PLAN: r0=7(x1), r1=78(y1), r2=132(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 78
LDI r2, 132
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
