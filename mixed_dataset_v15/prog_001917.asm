; DESCRIPTION: Draws a yellow line from (348, 28) to (174, 62).
; PLAN: r0=348(x1), r1=28(y1), r2=174(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 28
LDI r2, 174
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
