; DESCRIPTION: Draws a purple line from (114, 171) to (134, 128).
; PLAN: r0=114(x1), r1=171(y1), r2=134(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 171
LDI r2, 134
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
