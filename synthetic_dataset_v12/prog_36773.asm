; DESCRIPTION: Draws a purple line from (16, 192) to (356, 255).
; PLAN: r0=16(x1), r1=192(y1), r2=356(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 192
LDI r2, 356
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
