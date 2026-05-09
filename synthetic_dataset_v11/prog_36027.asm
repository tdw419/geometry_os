; DESCRIPTION: Draws a orange circle centered at (190, 243) with radius 10.
; PLAN: r0=190(x), r1=243(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 243
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
