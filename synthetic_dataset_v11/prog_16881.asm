; DESCRIPTION: Places a purple line segment connecting (138, 61) to (207, 234).
; PLAN: r0=138(x1), r1=61(y1), r2=207(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 61
LDI r2, 207
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
