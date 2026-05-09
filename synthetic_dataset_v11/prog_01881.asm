; DESCRIPTION: Draws a purple line from (193, 157) to (57, 8).
; PLAN: r0=193(x1), r1=157(y1), r2=57(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 157
LDI r2, 57
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
