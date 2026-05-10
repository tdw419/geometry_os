; DESCRIPTION: Draws a red line from (76, 44) to (338, 101).
; PLAN: r0=76(x1), r1=44(y1), r2=338(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 44
LDI r2, 338
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
