; DESCRIPTION: Draws a orange circle centered at (186, 87) with radius 42.
; PLAN: r0=186(x), r1=87(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 87
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
