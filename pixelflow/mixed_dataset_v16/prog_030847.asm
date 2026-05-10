; DESCRIPTION: Draws a purple line from (240, 184) to (511, 33).
; PLAN: r0=240(x1), r1=184(y1), r2=511(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 184
LDI r2, 511
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
