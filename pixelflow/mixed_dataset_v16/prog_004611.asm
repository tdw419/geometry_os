; DESCRIPTION: Places a red line segment connecting (56, 115) to (434, 188).
; PLAN: r0=56(x1), r1=115(y1), r2=434(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 115
LDI r2, 434
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
