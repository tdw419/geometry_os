; DESCRIPTION: Places a purple line segment connecting (135, 120) to (237, 214).
; PLAN: r0=135(x1), r1=120(y1), r2=237(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 120
LDI r2, 237
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
