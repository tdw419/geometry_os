; DESCRIPTION: Draws a red line from (74, 49) to (122, 35).
; PLAN: r0=74(x1), r1=49(y1), r2=122(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 49
LDI r2, 122
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
