; DESCRIPTION: Draws a purple line from (232, 247) to (117, 220).
; PLAN: r0=232(x1), r1=247(y1), r2=117(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 247
LDI r2, 117
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
