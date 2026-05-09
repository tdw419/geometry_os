; DESCRIPTION: Draws a purple line from (291, 58) to (269, 55).
; PLAN: r0=291(x1), r1=58(y1), r2=269(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 58
LDI r2, 269
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
