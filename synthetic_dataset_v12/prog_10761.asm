; DESCRIPTION: Draws a yellow line from (405, 184) to (283, 147).
; PLAN: r0=405(x1), r1=184(y1), r2=283(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 184
LDI r2, 283
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
