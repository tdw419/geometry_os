; DESCRIPTION: Places a yellow line segment connecting (449, 6) to (500, 171).
; PLAN: r0=449(x1), r1=6(y1), r2=500(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 6
LDI r2, 500
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
