; DESCRIPTION: Places a red line segment connecting (403, 41) to (114, 44).
; PLAN: r0=403(x1), r1=41(y1), r2=114(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 41
LDI r2, 114
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
