; DESCRIPTION: Places a purple line segment connecting (49, 96) to (146, 239).
; PLAN: r0=49(x1), r1=96(y1), r2=146(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 96
LDI r2, 146
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
