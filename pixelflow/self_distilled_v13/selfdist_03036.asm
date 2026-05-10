; DESCRIPTION: Draws a purple line from (356, 113) to (240, 193).
; PLAN: r0=356(x1), r1=113(y1), r2=240(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 113
LDI r2, 240
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
