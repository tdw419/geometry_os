; DESCRIPTION: Places a yellow line segment connecting (407, 71) to (237, 25).
; PLAN: r0=407(x1), r1=71(y1), r2=237(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 71
LDI r2, 237
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
