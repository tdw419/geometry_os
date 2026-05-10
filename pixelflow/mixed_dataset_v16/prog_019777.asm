; DESCRIPTION: Draws a purple line from (278, 186) to (184, 193).
; PLAN: r0=278(x1), r1=186(y1), r2=184(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 186
LDI r2, 184
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
