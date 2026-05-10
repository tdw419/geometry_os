; DESCRIPTION: Draws a black line from (501, 177) to (181, 100).
; PLAN: r0=501(x1), r1=177(y1), r2=181(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 177
LDI r2, 181
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
