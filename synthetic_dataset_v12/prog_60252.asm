; DESCRIPTION: Draws a yellow line from (248, 96) to (348, 24).
; PLAN: r0=248(x1), r1=96(y1), r2=348(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 96
LDI r2, 348
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
