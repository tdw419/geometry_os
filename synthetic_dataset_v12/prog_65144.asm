; DESCRIPTION: Places a red line segment connecting (80, 111) to (128, 163).
; PLAN: r0=80(x1), r1=111(y1), r2=128(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 111
LDI r2, 128
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
