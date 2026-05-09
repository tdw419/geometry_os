; DESCRIPTION: Draws a yellow line from (214, 162) to (133, 191).
; PLAN: r0=214(x1), r1=162(y1), r2=133(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 162
LDI r2, 133
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
