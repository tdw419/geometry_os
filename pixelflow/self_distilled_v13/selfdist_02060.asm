; DESCRIPTION: Draws a yellow line from (328, 18) to (374, 93).
; PLAN: r0=328(x1), r1=18(y1), r2=374(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 18
LDI r2, 374
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
