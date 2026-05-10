; DESCRIPTION: Places a magenta line segment connecting (390, 40) to (236, 228).
; PLAN: r0=390(x1), r1=40(y1), r2=236(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 40
LDI r2, 236
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
