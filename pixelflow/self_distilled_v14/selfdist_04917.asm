; DESCRIPTION: Draws a yellow line from (374, 193) to (76, 101).
; PLAN: r0=374(x1), r1=193(y1), r2=76(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 193
LDI r2, 76
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
