; DESCRIPTION: Draws a blue line from (259, 22) to (495, 214).
; PLAN: r0=259(x1), r1=22(y1), r2=495(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 22
LDI r2, 495
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
