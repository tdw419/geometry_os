; DESCRIPTION: Renders a yellow line segment connecting (98, 59) to (261, 116).
; PLAN: r0=98(x1), r1=59(y1), r2=261(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 59
LDI r2, 261
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
