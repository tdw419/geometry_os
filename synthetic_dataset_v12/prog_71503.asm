; DESCRIPTION: Places a red line segment connecting (359, 192) to (111, 115).
; PLAN: r0=359(x1), r1=192(y1), r2=111(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 192
LDI r2, 111
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
