; DESCRIPTION: Places a purple line segment connecting (165, 98) to (40, 182).
; PLAN: r0=165(x1), r1=98(y1), r2=40(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 98
LDI r2, 40
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
