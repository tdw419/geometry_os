; DESCRIPTION: Draws a yellow line from (363, 105) to (148, 17).
; PLAN: r0=363(x1), r1=105(y1), r2=148(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 105
LDI r2, 148
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
