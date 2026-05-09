; DESCRIPTION: Draws a yellow line from (162, 71) to (347, 20).
; PLAN: r0=162(x1), r1=71(y1), r2=347(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 71
LDI r2, 347
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
