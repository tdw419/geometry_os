; DESCRIPTION: Draws a yellow line from (212, 36) to (254, 17).
; PLAN: r0=212(x1), r1=36(y1), r2=254(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 36
LDI r2, 254
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
