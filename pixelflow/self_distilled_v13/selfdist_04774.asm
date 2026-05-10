; DESCRIPTION: Renders a orange circular shape at (14, 190) with radius 79.
; PLAN: r0=14(x), r1=190(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 190
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
