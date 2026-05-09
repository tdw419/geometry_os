; DESCRIPTION: Draws a yellow line from (375, 149) to (348, 223).
; PLAN: r0=375(x1), r1=149(y1), r2=348(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 149
LDI r2, 348
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
