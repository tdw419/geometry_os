; DESCRIPTION: Places a magenta line segment connecting (376, 60) to (59, 63).
; PLAN: r0=376(x1), r1=60(y1), r2=59(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 60
LDI r2, 59
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
