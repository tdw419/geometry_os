; DESCRIPTION: Places a red line segment connecting (136, 124) to (181, 31).
; PLAN: r0=136(x1), r1=124(y1), r2=181(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 124
LDI r2, 181
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
