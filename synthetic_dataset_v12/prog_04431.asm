; DESCRIPTION: Draws a purple line from (372, 141) to (384, 211).
; PLAN: r0=372(x1), r1=141(y1), r2=384(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 141
LDI r2, 384
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
