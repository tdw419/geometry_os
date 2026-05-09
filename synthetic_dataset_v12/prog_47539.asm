; DESCRIPTION: Places a magenta line segment connecting (377, 128) to (315, 117).
; PLAN: r0=377(x1), r1=128(y1), r2=315(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 128
LDI r2, 315
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
