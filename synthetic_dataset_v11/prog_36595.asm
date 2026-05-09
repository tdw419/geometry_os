; DESCRIPTION: Renders a white line between points (78, 203) and (182, 167).
; PLAN: r0=78(x1), r1=203(y1), r2=182(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 203
LDI r2, 182
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
