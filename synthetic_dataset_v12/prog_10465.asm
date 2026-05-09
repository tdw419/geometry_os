; DESCRIPTION: Draws a red line from (435, 179) to (16, 41).
; PLAN: r0=435(x1), r1=179(y1), r2=16(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 179
LDI r2, 16
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
