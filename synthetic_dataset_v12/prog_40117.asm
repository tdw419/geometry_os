; DESCRIPTION: Places a purple line segment connecting (206, 131) to (29, 249).
; PLAN: r0=206(x1), r1=131(y1), r2=29(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 131
LDI r2, 29
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
