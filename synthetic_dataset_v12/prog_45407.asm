; DESCRIPTION: Places a yellow line segment connecting (80, 199) to (376, 28).
; PLAN: r0=80(x1), r1=199(y1), r2=376(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 199
LDI r2, 376
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
