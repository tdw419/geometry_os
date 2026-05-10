; DESCRIPTION: Creates a magenta circular shape at (41, 126) with radius 38.
; PLAN: r0=41(x), r1=126(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 126
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
