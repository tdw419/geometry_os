; DESCRIPTION: Draws a yellow line from (124, 160) to (101, 254).
; PLAN: r0=124(x1), r1=160(y1), r2=101(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 160
LDI r2, 101
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
