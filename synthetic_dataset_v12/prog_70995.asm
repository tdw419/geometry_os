; DESCRIPTION: Renders a orange line between points (380, 190) and (215, 203).
; PLAN: r0=380(x1), r1=190(y1), r2=215(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 190
LDI r2, 215
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
