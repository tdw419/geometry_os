; DESCRIPTION: Draws a magenta line from (471, 156) to (404, 18).
; PLAN: r0=471(x1), r1=156(y1), r2=404(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 156
LDI r2, 404
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
