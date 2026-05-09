; DESCRIPTION: Draws a yellow line from (199, 252) to (151, 224).
; PLAN: r0=199(x1), r1=252(y1), r2=151(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 252
LDI r2, 151
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
