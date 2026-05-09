; DESCRIPTION: Draws a yellow line from (395, 22) to (139, 72).
; PLAN: r0=395(x1), r1=22(y1), r2=139(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 22
LDI r2, 139
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
