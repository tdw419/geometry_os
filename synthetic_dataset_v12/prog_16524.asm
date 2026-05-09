; DESCRIPTION: Draws a red line from (469, 31) to (504, 157).
; PLAN: r0=469(x1), r1=31(y1), r2=504(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 31
LDI r2, 504
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
