; DESCRIPTION: Draws a orange circle centered at (430, 93) with radius 29.
; PLAN: r0=430(x), r1=93(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 93
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
