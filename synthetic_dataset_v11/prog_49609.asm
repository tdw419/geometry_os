; DESCRIPTION: Renders a yellow line between points (239, 122) and (193, 147).
; PLAN: r0=239(x1), r1=122(y1), r2=193(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 122
LDI r2, 193
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
