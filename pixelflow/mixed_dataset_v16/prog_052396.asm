; DESCRIPTION: Places a cyan line segment connecting (500, 167) to (41, 36).
; PLAN: r0=500(x1), r1=167(y1), r2=41(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 167
LDI r2, 41
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
