; DESCRIPTION: Draws a magenta line from (11, 133) to (471, 50).
; PLAN: r0=11(x1), r1=133(y1), r2=471(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 133
LDI r2, 471
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
