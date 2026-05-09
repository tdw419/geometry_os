; DESCRIPTION: Draws a yellow line from (234, 156) to (135, 149).
; PLAN: r0=234(x1), r1=156(y1), r2=135(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 156
LDI r2, 135
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
