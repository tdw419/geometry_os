; DESCRIPTION: Places a red line segment connecting (278, 144) to (176, 163).
; PLAN: r0=278(x1), r1=144(y1), r2=176(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 144
LDI r2, 176
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
