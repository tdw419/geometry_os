; DESCRIPTION: Draws a red line from (184, 122) to (52, 76).
; PLAN: r0=184(x1), r1=122(y1), r2=52(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 122
LDI r2, 52
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
