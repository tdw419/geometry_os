; DESCRIPTION: Places a red line segment connecting (374, 175) to (434, 144).
; PLAN: r0=374(x1), r1=175(y1), r2=434(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 175
LDI r2, 434
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
