; DESCRIPTION: Draws a purple line from (16, 35) to (303, 184).
; PLAN: r0=16(x1), r1=35(y1), r2=303(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 35
LDI r2, 303
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
