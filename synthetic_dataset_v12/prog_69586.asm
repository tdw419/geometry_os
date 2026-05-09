; DESCRIPTION: Draws a yellow line from (412, 0) to (350, 31).
; PLAN: r0=412(x1), r1=0(y1), r2=350(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 0
LDI r2, 350
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
