; DESCRIPTION: Places a purple line segment connecting (192, 0) to (24, 146).
; PLAN: r0=192(x1), r1=0(y1), r2=24(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 0
LDI r2, 24
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
