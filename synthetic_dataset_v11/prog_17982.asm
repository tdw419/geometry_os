; DESCRIPTION: Renders a orange line between points (149, 94) and (215, 171).
; PLAN: r0=149(x1), r1=94(y1), r2=215(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 94
LDI r2, 215
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
