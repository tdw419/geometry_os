; DESCRIPTION: Draws a purple line from (209, 146) to (219, 122).
; PLAN: r0=209(x1), r1=146(y1), r2=219(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 146
LDI r2, 219
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
