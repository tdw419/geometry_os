; DESCRIPTION: Places a yellow line segment connecting (291, 199) to (232, 230).
; PLAN: r0=291(x1), r1=199(y1), r2=232(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 199
LDI r2, 232
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
