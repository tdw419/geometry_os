; DESCRIPTION: Places a purple line segment connecting (446, 149) to (414, 138).
; PLAN: r0=446(x1), r1=149(y1), r2=414(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 149
LDI r2, 414
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
