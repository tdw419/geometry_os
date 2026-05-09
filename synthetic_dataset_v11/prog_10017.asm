; DESCRIPTION: Places a purple line segment connecting (49, 215) to (165, 226).
; PLAN: r0=49(x1), r1=215(y1), r2=165(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 215
LDI r2, 165
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
