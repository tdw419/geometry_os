; DESCRIPTION: Draws a red line from (41, 38) to (207, 244).
; PLAN: r0=41(x1), r1=38(y1), r2=207(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 38
LDI r2, 207
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
