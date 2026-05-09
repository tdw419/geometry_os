; DESCRIPTION: Renders a yellow line between points (80, 13) and (72, 120).
; PLAN: r0=80(x1), r1=13(y1), r2=72(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 13
LDI r2, 72
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
