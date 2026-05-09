; DESCRIPTION: Places a purple line segment connecting (470, 167) to (413, 38).
; PLAN: r0=470(x1), r1=167(y1), r2=413(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 167
LDI r2, 413
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
