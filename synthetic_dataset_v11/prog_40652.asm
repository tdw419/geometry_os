; DESCRIPTION: Places a purple line segment connecting (47, 191) to (50, 113).
; PLAN: r0=47(x1), r1=191(y1), r2=50(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 191
LDI r2, 50
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
