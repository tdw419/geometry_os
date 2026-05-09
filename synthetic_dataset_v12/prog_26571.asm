; DESCRIPTION: Places a green line segment connecting (434, 198) to (15, 94).
; PLAN: r0=434(x1), r1=198(y1), r2=15(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 198
LDI r2, 15
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
