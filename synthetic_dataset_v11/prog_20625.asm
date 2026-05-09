; DESCRIPTION: Draws a magenta line from (78, 213) to (58, 119).
; PLAN: r0=78(x1), r1=213(y1), r2=58(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 213
LDI r2, 58
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
