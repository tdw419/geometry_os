; DESCRIPTION: Draws a yellow line from (72, 14) to (155, 239).
; PLAN: r0=72(x1), r1=14(y1), r2=155(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 14
LDI r2, 155
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
