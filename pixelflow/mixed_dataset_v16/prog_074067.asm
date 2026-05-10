; DESCRIPTION: Places a purple line segment connecting (127, 30) to (165, 240).
; PLAN: r0=127(x1), r1=30(y1), r2=165(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 30
LDI r2, 165
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
