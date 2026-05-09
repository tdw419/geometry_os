; DESCRIPTION: Draws a blue line from (303, 155) to (316, 239).
; PLAN: r0=303(x1), r1=155(y1), r2=316(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 155
LDI r2, 316
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
