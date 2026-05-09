; DESCRIPTION: Draws a blue line from (232, 253) to (17, 50).
; PLAN: r0=232(x1), r1=253(y1), r2=17(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 253
LDI r2, 17
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
