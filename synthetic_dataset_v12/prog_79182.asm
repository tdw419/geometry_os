; DESCRIPTION: Places a purple line segment connecting (445, 194) to (328, 28).
; PLAN: r0=445(x1), r1=194(y1), r2=328(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 194
LDI r2, 328
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
