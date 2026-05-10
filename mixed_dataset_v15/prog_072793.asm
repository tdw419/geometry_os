; DESCRIPTION: Draws a orange circle centered at (401, 187) with radius 24.
; PLAN: r0=401(x), r1=187(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 187
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
