; DESCRIPTION: Places a purple line segment connecting (209, 39) to (245, 160).
; PLAN: r0=209(x1), r1=39(y1), r2=245(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 39
LDI r2, 245
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
