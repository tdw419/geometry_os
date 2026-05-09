; DESCRIPTION: Places a purple line segment connecting (113, 96) to (59, 195).
; PLAN: r0=113(x1), r1=96(y1), r2=59(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 96
LDI r2, 59
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
