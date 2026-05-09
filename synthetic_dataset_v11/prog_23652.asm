; DESCRIPTION: Draws a red line from (7, 53) to (122, 36).
; PLAN: r0=7(x1), r1=53(y1), r2=122(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 53
LDI r2, 122
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
