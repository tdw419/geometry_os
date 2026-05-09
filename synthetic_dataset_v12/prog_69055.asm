; DESCRIPTION: Places a red line segment connecting (346, 41) to (200, 27).
; PLAN: r0=346(x1), r1=41(y1), r2=200(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 41
LDI r2, 200
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
