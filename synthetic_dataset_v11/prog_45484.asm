; DESCRIPTION: Draws a purple line from (151, 173) to (223, 137).
; PLAN: r0=151(x1), r1=173(y1), r2=223(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 173
LDI r2, 223
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
