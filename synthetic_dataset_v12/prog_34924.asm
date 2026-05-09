; DESCRIPTION: Draws a yellow line from (199, 232) to (367, 144).
; PLAN: r0=199(x1), r1=232(y1), r2=367(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 232
LDI r2, 367
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
