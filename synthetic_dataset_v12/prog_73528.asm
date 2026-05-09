; DESCRIPTION: Places a yellow line segment connecting (303, 235) to (400, 78).
; PLAN: r0=303(x1), r1=235(y1), r2=400(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 235
LDI r2, 400
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
