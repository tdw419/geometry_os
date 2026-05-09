; DESCRIPTION: Draws a black line from (221, 214) to (162, 101).
; PLAN: r0=221(x1), r1=214(y1), r2=162(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 214
LDI r2, 162
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
