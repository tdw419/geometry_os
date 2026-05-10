; DESCRIPTION: Draws a yellow line from (149, 101) to (288, 177).
; PLAN: r0=149(x1), r1=101(y1), r2=288(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 101
LDI r2, 288
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
