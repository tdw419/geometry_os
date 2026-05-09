; DESCRIPTION: Places a purple line segment connecting (359, 44) to (286, 29).
; PLAN: r0=359(x1), r1=44(y1), r2=286(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 44
LDI r2, 286
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
