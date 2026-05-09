; DESCRIPTION: Places a purple line segment connecting (15, 157) to (152, 57).
; PLAN: r0=15(x1), r1=157(y1), r2=152(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 157
LDI r2, 152
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
