; DESCRIPTION: Draws a red line from (40, 31) to (128, 179).
; PLAN: r0=40(x1), r1=31(y1), r2=128(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 31
LDI r2, 128
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
