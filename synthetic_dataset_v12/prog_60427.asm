; DESCRIPTION: Places a blue line segment connecting (124, 116) to (261, 127).
; PLAN: r0=124(x1), r1=116(y1), r2=261(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 116
LDI r2, 261
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
