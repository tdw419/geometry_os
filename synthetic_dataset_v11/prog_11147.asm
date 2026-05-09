; DESCRIPTION: Places a red line segment connecting (236, 221) to (41, 167).
; PLAN: r0=236(x1), r1=221(y1), r2=41(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 221
LDI r2, 41
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
