; DESCRIPTION: Draws a orange circle centered at (190, 34) with radius 27.
; PLAN: r0=190(x), r1=34(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 34
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
