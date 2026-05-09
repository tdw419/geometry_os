; DESCRIPTION: Draws a orange circle centered at (196, 221) with radius 35.
; PLAN: r0=196(x), r1=221(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 221
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
