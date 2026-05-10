; DESCRIPTION: Draws a magenta line from (458, 108) to (155, 15).
; PLAN: r0=458(x1), r1=108(y1), r2=155(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 108
LDI r2, 155
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
