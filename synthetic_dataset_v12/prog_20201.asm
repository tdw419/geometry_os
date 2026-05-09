; DESCRIPTION: Draws a red line from (443, 49) to (118, 224).
; PLAN: r0=443(x1), r1=49(y1), r2=118(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 49
LDI r2, 118
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
