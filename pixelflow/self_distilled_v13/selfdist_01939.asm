; DESCRIPTION: Renders a yellow line segment connecting (61, 80) to (387, 11).
; PLAN: r0=61(x1), r1=80(y1), r2=387(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 80
LDI r2, 387
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
