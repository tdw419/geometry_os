; DESCRIPTION: Draws a red line from (37, 31) to (47, 187).
; PLAN: r0=37(x1), r1=31(y1), r2=47(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 31
LDI r2, 47
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
