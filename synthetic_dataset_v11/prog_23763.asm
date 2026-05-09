; DESCRIPTION: Places a purple line segment connecting (151, 82) to (105, 198).
; PLAN: r0=151(x1), r1=82(y1), r2=105(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 82
LDI r2, 105
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
