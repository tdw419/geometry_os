; DESCRIPTION: Draws a magenta line from (199, 57) to (137, 248).
; PLAN: r0=199(x1), r1=57(y1), r2=137(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 57
LDI r2, 137
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
