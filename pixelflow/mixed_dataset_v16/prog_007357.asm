; DESCRIPTION: Renders a orange rectangular region spanning 98 by 53 at (219, 81).
; PLAN: r0=219(x), r1=81(y), r2=98(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 81
LDI r2, 98
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
