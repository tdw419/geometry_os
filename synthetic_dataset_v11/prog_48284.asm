; DESCRIPTION: Draws a magenta line from (39, 78) to (109, 90).
; PLAN: r0=39(x1), r1=78(y1), r2=109(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 78
LDI r2, 109
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
