; DESCRIPTION: Draws a purple line from (382, 93) to (167, 84).
; PLAN: r0=382(x1), r1=93(y1), r2=167(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 93
LDI r2, 167
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
