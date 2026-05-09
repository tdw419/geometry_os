; DESCRIPTION: Draws a red line from (379, 36) to (318, 128).
; PLAN: r0=379(x1), r1=36(y1), r2=318(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 36
LDI r2, 318
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
