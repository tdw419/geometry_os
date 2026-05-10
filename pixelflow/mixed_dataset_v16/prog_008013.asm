; DESCRIPTION: Draws a orange circle centered at (198, 71) with radius 64.
; PLAN: r0=198(x), r1=71(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 71
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
