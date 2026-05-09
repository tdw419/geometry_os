; DESCRIPTION: Renders a orange line between points (14, 215) and (89, 134).
; PLAN: r0=14(x1), r1=215(y1), r2=89(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 215
LDI r2, 89
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
