; DESCRIPTION: Draws a purple line from (198, 151) to (245, 25).
; PLAN: r0=198(x1), r1=151(y1), r2=245(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 151
LDI r2, 245
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
