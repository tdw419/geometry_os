; DESCRIPTION: Places a purple line segment connecting (65, 209) to (431, 57).
; PLAN: r0=65(x1), r1=209(y1), r2=431(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 209
LDI r2, 431
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
