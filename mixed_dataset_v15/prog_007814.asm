; DESCRIPTION: Draws a purple line from (57, 16) to (74, 60).
; PLAN: r0=57(x1), r1=16(y1), r2=74(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 16
LDI r2, 74
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
