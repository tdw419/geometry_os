; DESCRIPTION: Places a red line segment connecting (184, 252) to (128, 51).
; PLAN: r0=184(x1), r1=252(y1), r2=128(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 252
LDI r2, 128
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
