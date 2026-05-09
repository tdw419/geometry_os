; DESCRIPTION: Places a purple line segment connecting (305, 4) to (276, 202).
; PLAN: r0=305(x1), r1=4(y1), r2=276(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 4
LDI r2, 276
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
