; DESCRIPTION: Places a black line segment connecting (305, 246) to (41, 113).
; PLAN: r0=305(x1), r1=246(y1), r2=41(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 246
LDI r2, 41
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
