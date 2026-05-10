; DESCRIPTION: Renders a red line segment connecting (231, 2) to (77, 39).
; PLAN: r0=231(x1), r1=2(y1), r2=77(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 2
LDI r2, 77
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
