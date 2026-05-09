; DESCRIPTION: Draws a purple line from (459, 93) to (384, 36).
; PLAN: r0=459(x1), r1=93(y1), r2=384(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 93
LDI r2, 384
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
