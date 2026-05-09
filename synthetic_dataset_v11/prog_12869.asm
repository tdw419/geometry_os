; DESCRIPTION: Places a blue line segment connecting (99, 104) to (123, 246).
; PLAN: r0=99(x1), r1=104(y1), r2=123(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 104
LDI r2, 123
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
