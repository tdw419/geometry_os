; DESCRIPTION: Places a red line segment connecting (126, 84) to (282, 123).
; PLAN: r0=126(x1), r1=84(y1), r2=282(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 84
LDI r2, 282
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
