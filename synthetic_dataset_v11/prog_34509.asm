; DESCRIPTION: Draws a yellow line from (121, 148) to (151, 5).
; PLAN: r0=121(x1), r1=148(y1), r2=151(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 148
LDI r2, 151
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
