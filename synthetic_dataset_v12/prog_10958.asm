; DESCRIPTION: Places a yellow line segment connecting (374, 50) to (7, 246).
; PLAN: r0=374(x1), r1=50(y1), r2=7(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 50
LDI r2, 7
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
