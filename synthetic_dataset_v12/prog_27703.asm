; DESCRIPTION: Draws a purple line from (265, 32) to (199, 46).
; PLAN: r0=265(x1), r1=32(y1), r2=199(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 32
LDI r2, 199
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
