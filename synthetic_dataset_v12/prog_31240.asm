; DESCRIPTION: Draws a yellow line from (496, 48) to (412, 5).
; PLAN: r0=496(x1), r1=48(y1), r2=412(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 48
LDI r2, 412
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
