; DESCRIPTION: Draws a orange circle centered at (449, 186) with radius 63.
; PLAN: r0=449(x), r1=186(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 186
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
