; DESCRIPTION: Renders a green line segment connecting (342, 95) to (133, 87).
; PLAN: r0=342(x1), r1=95(y1), r2=133(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 95
LDI r2, 133
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
