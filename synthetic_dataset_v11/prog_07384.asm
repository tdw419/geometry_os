; DESCRIPTION: Renders a white line between points (41, 15) and (21, 135).
; PLAN: r0=41(x1), r1=15(y1), r2=21(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 15
LDI r2, 21
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
