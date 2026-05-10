; DESCRIPTION: Draws a yellow line from (445, 88) to (506, 181).
; PLAN: r0=445(x1), r1=88(y1), r2=506(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 88
LDI r2, 506
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
