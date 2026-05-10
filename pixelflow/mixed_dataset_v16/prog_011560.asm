; DESCRIPTION: Draws a orange circle centered at (161, 154) with radius 24.
; PLAN: r0=161(x), r1=154(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 154
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
