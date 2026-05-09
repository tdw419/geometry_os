; DESCRIPTION: Places a purple line segment connecting (65, 149) to (114, 12).
; PLAN: r0=65(x1), r1=149(y1), r2=114(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 149
LDI r2, 114
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
