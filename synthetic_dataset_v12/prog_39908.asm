; DESCRIPTION: Draws a purple line from (255, 44) to (374, 18).
; PLAN: r0=255(x1), r1=44(y1), r2=374(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 44
LDI r2, 374
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
