; DESCRIPTION: Draws a yellow line from (7, 162) to (148, 184).
; PLAN: r0=7(x1), r1=162(y1), r2=148(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 162
LDI r2, 148
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
