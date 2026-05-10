; DESCRIPTION: Draws a yellow line from (229, 232) to (144, 47).
; PLAN: r0=229(x1), r1=232(y1), r2=144(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 232
LDI r2, 144
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
