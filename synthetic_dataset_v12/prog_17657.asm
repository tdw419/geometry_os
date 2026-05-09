; DESCRIPTION: Places a purple line segment connecting (160, 50) to (445, 31).
; PLAN: r0=160(x1), r1=50(y1), r2=445(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 50
LDI r2, 445
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
