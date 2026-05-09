; DESCRIPTION: Places a red line segment connecting (511, 155) to (28, 29).
; PLAN: r0=511(x1), r1=155(y1), r2=28(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 155
LDI r2, 28
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
