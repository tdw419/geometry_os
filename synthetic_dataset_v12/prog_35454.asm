; DESCRIPTION: Draws a red line from (126, 143) to (476, 252).
; PLAN: r0=126(x1), r1=143(y1), r2=476(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 143
LDI r2, 476
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
