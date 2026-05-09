; DESCRIPTION: Renders a orange line between points (294, 238) and (78, 170).
; PLAN: r0=294(x1), r1=238(y1), r2=78(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 238
LDI r2, 78
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
