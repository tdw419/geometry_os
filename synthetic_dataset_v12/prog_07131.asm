; DESCRIPTION: Places a yellow line segment connecting (372, 199) to (72, 169).
; PLAN: r0=372(x1), r1=199(y1), r2=72(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 199
LDI r2, 72
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
