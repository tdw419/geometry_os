; DESCRIPTION: Places a purple line segment connecting (291, 235) to (229, 214).
; PLAN: r0=291(x1), r1=235(y1), r2=229(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 235
LDI r2, 229
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
