; DESCRIPTION: Draws a yellow line from (365, 24) to (374, 5).
; PLAN: r0=365(x1), r1=24(y1), r2=374(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 24
LDI r2, 374
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
