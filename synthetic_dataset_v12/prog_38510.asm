; DESCRIPTION: Draws a purple line from (320, 226) to (287, 52).
; PLAN: r0=320(x1), r1=226(y1), r2=287(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 226
LDI r2, 287
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
