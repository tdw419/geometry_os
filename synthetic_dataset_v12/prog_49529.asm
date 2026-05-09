; DESCRIPTION: Draws a yellow line from (259, 65) to (423, 100).
; PLAN: r0=259(x1), r1=65(y1), r2=423(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 65
LDI r2, 423
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
