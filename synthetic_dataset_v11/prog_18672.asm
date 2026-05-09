; DESCRIPTION: Draws a red line from (49, 65) to (252, 131).
; PLAN: r0=49(x1), r1=65(y1), r2=252(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 65
LDI r2, 252
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
