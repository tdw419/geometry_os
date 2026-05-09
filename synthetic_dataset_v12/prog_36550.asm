; DESCRIPTION: Places a red line segment connecting (108, 87) to (272, 163).
; PLAN: r0=108(x1), r1=87(y1), r2=272(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 87
LDI r2, 272
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
