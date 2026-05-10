; DESCRIPTION: Places a red line segment connecting (220, 43) to (101, 124).
; PLAN: r0=220(x1), r1=43(y1), r2=101(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 43
LDI r2, 101
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
