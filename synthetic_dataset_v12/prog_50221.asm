; DESCRIPTION: Places a purple line segment connecting (373, 111) to (281, 220).
; PLAN: r0=373(x1), r1=111(y1), r2=281(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 111
LDI r2, 281
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
