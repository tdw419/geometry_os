; DESCRIPTION: Draws a yellow line from (395, 12) to (368, 159).
; PLAN: r0=395(x1), r1=12(y1), r2=368(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 12
LDI r2, 368
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
