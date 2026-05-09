; DESCRIPTION: Places a blue line segment connecting (258, 182) to (203, 165).
; PLAN: r0=258(x1), r1=182(y1), r2=203(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 182
LDI r2, 203
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
