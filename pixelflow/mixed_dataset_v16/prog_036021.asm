; DESCRIPTION: Draws a purple line from (239, 165) to (232, 214).
; PLAN: r0=239(x1), r1=165(y1), r2=232(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 165
LDI r2, 232
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
