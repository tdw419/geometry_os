; DESCRIPTION: Draws a yellow line from (374, 139) to (341, 128).
; PLAN: r0=374(x1), r1=139(y1), r2=341(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 139
LDI r2, 341
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
