; DESCRIPTION: Draws a purple line from (299, 135) to (241, 103).
; PLAN: r0=299(x1), r1=135(y1), r2=241(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 135
LDI r2, 241
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
