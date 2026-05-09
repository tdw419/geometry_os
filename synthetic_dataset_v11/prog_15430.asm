; DESCRIPTION: Draws a orange circle centered at (42, 54) with radius 34.
; PLAN: r0=42(x), r1=54(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 54
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
