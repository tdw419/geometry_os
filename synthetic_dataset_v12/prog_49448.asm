; DESCRIPTION: Draws a blue line from (232, 126) to (56, 25).
; PLAN: r0=232(x1), r1=126(y1), r2=56(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 126
LDI r2, 56
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
