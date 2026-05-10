; DESCRIPTION: Draws a yellow line from (412, 22) to (56, 56).
; PLAN: r0=412(x1), r1=22(y1), r2=56(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 22
LDI r2, 56
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
