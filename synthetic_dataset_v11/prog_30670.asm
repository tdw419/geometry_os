; DESCRIPTION: Draws a black line from (254, 49) to (210, 147).
; PLAN: r0=254(x1), r1=49(y1), r2=210(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 49
LDI r2, 210
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
