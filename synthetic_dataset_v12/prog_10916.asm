; DESCRIPTION: Draws a purple line from (497, 144) to (27, 219).
; PLAN: r0=497(x1), r1=144(y1), r2=27(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 144
LDI r2, 27
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
