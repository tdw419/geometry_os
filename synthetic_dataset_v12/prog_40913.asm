; DESCRIPTION: Draws a purple line from (32, 198) to (376, 55).
; PLAN: r0=32(x1), r1=198(y1), r2=376(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 198
LDI r2, 376
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
