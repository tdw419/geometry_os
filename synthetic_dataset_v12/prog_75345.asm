; DESCRIPTION: Places a purple line segment connecting (307, 42) to (232, 225).
; PLAN: r0=307(x1), r1=42(y1), r2=232(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 42
LDI r2, 232
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
