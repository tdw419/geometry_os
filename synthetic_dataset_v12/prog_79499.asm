; DESCRIPTION: Places a red line segment connecting (213, 18) to (83, 41).
; PLAN: r0=213(x1), r1=18(y1), r2=83(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 18
LDI r2, 83
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
