; DESCRIPTION: Draws a red line from (70, 148) to (252, 139).
; PLAN: r0=70(x1), r1=148(y1), r2=252(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 148
LDI r2, 252
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
