; DESCRIPTION: Draws a purple line from (62, 27) to (372, 142).
; PLAN: r0=62(x1), r1=27(y1), r2=372(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 27
LDI r2, 372
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
