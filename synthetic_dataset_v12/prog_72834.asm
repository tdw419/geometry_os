; DESCRIPTION: Draws a yellow line from (374, 173) to (201, 175).
; PLAN: r0=374(x1), r1=173(y1), r2=201(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 173
LDI r2, 201
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
