; DESCRIPTION: Draws a purple line from (227, 255) to (17, 195).
; PLAN: r0=227(x1), r1=255(y1), r2=17(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 255
LDI r2, 17
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
