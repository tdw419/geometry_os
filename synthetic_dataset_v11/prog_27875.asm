; DESCRIPTION: Draws a purple line from (219, 143) to (26, 59).
; PLAN: r0=219(x1), r1=143(y1), r2=26(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 143
LDI r2, 26
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
