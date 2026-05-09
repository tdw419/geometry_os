; DESCRIPTION: Draws a orange circle centered at (70, 179) with radius 42.
; PLAN: r0=70(x), r1=179(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 179
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
