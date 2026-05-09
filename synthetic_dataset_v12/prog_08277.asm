; DESCRIPTION: Draws a purple line from (439, 157) to (256, 25).
; PLAN: r0=439(x1), r1=157(y1), r2=256(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 157
LDI r2, 256
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
