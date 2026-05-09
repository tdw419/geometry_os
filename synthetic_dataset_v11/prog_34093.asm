; DESCRIPTION: Draws a yellow line from (17, 211) to (175, 189).
; PLAN: r0=17(x1), r1=211(y1), r2=175(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 211
LDI r2, 175
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
