; DESCRIPTION: Draws a magenta line from (449, 80) to (280, 116).
; PLAN: r0=449(x1), r1=80(y1), r2=280(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 80
LDI r2, 280
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
