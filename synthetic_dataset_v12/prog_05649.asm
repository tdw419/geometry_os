; DESCRIPTION: Places a magenta line segment connecting (36, 104) to (236, 238).
; PLAN: r0=36(x1), r1=104(y1), r2=236(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 104
LDI r2, 236
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
