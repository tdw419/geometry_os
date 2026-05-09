; DESCRIPTION: Draws a yellow line from (211, 148) to (506, 92).
; PLAN: r0=211(x1), r1=148(y1), r2=506(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 148
LDI r2, 506
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
