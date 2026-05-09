; DESCRIPTION: Places a purple line segment connecting (5, 12) to (446, 172).
; PLAN: r0=5(x1), r1=12(y1), r2=446(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 12
LDI r2, 446
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
