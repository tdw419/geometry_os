; DESCRIPTION: Places a yellow line segment connecting (318, 247) to (92, 120).
; PLAN: r0=318(x1), r1=247(y1), r2=92(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 247
LDI r2, 92
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
