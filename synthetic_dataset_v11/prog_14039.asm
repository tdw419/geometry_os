; DESCRIPTION: Draws a purple line from (191, 221) to (32, 155).
; PLAN: r0=191(x1), r1=221(y1), r2=32(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 221
LDI r2, 32
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
