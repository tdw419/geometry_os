; DESCRIPTION: Renders a white line between points (35, 156) and (72, 80).
; PLAN: r0=35(x1), r1=156(y1), r2=72(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 156
LDI r2, 72
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
