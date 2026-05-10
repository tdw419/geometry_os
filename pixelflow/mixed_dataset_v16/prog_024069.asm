; DESCRIPTION: Places a purple line segment connecting (73, 95) to (67, 228).
; PLAN: r0=73(x1), r1=95(y1), r2=67(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 95
LDI r2, 67
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
