; DESCRIPTION: Draws a magenta line from (199, 192) to (149, 52).
; PLAN: r0=199(x1), r1=192(y1), r2=149(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 192
LDI r2, 149
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
