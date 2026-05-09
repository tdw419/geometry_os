; DESCRIPTION: Places a purple line segment connecting (43, 38) to (286, 48).
; PLAN: r0=43(x1), r1=38(y1), r2=286(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 38
LDI r2, 286
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
