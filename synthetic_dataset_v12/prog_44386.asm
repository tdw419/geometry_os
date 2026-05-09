; DESCRIPTION: Draws a red line from (416, 153) to (41, 192).
; PLAN: r0=416(x1), r1=153(y1), r2=41(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 153
LDI r2, 41
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
