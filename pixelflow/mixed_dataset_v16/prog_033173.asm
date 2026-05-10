; DESCRIPTION: Draws a orange circle centered at (358, 50) with radius 70.
; PLAN: r0=358(x), r1=50(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 50
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
