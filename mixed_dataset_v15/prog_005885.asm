; DESCRIPTION: Draws a yellow line from (466, 1) to (501, 149).
; PLAN: r0=466(x1), r1=1(y1), r2=501(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 1
LDI r2, 501
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
