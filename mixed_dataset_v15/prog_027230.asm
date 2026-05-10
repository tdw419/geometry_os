; DESCRIPTION: Renders a white line between points (74, 255) and (41, 167).
; PLAN: r0=74(x1), r1=255(y1), r2=41(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 255
LDI r2, 41
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
