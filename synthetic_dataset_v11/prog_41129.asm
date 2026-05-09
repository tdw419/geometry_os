; DESCRIPTION: Draws a purple line from (206, 85) to (175, 253).
; PLAN: r0=206(x1), r1=85(y1), r2=175(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 85
LDI r2, 175
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
