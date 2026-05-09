; DESCRIPTION: Draws a red line from (310, 192) to (374, 211).
; PLAN: r0=310(x1), r1=192(y1), r2=374(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 192
LDI r2, 374
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
