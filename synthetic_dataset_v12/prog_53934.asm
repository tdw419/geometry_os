; DESCRIPTION: Draws a red line from (208, 9) to (456, 170).
; PLAN: r0=208(x1), r1=9(y1), r2=456(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 9
LDI r2, 456
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
