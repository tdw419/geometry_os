; DESCRIPTION: Draws a yellow line from (160, 62) to (286, 252).
; PLAN: r0=160(x1), r1=62(y1), r2=286(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 62
LDI r2, 286
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
