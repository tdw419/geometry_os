; DESCRIPTION: Draws a red line from (122, 53) to (112, 70).
; PLAN: r0=122(x1), r1=53(y1), r2=112(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 53
LDI r2, 112
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
