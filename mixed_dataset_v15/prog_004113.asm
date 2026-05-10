; DESCRIPTION: Draws a purple line from (480, 144) to (356, 137).
; PLAN: r0=480(x1), r1=144(y1), r2=356(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 144
LDI r2, 356
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
