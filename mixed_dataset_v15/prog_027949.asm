; DESCRIPTION: Draws a red line from (458, 128) to (293, 101).
; PLAN: r0=458(x1), r1=128(y1), r2=293(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 128
LDI r2, 293
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
