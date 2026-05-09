; DESCRIPTION: Places a purple line segment connecting (406, 195) to (15, 29).
; PLAN: r0=406(x1), r1=195(y1), r2=15(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 195
LDI r2, 15
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
