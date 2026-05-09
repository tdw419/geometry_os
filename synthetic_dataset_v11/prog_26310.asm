; DESCRIPTION: Places a black line segment connecting (109, 155) to (108, 186).
; PLAN: r0=109(x1), r1=155(y1), r2=108(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 155
LDI r2, 108
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
