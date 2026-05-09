; DESCRIPTION: Places a magenta line segment connecting (7, 14) to (59, 157).
; PLAN: r0=7(x1), r1=14(y1), r2=59(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 14
LDI r2, 59
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
