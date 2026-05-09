; DESCRIPTION: Places a purple line segment connecting (59, 108) to (414, 166).
; PLAN: r0=59(x1), r1=108(y1), r2=414(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 108
LDI r2, 414
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
