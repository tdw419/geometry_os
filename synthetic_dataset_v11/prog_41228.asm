; DESCRIPTION: Draws a purple line from (12, 171) to (244, 73).
; PLAN: r0=12(x1), r1=171(y1), r2=244(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 171
LDI r2, 244
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
