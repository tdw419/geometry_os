; DESCRIPTION: Renders a yellow line between points (180, 41) and (76, 117).
; PLAN: r0=180(x1), r1=41(y1), r2=76(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 41
LDI r2, 76
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
