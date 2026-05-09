; DESCRIPTION: Renders a orange line between points (325, 21) and (509, 190).
; PLAN: r0=325(x1), r1=21(y1), r2=509(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 21
LDI r2, 509
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
