; DESCRIPTION: Draws a yellow line from (199, 97) to (260, 63).
; PLAN: r0=199(x1), r1=97(y1), r2=260(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 97
LDI r2, 260
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
