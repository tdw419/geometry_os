; DESCRIPTION: Draws a red line from (469, 173) to (272, 190).
; PLAN: r0=469(x1), r1=173(y1), r2=272(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 173
LDI r2, 272
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
