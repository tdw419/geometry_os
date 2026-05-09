; DESCRIPTION: Creates a magenta circular shape at (199, 208) with radius 41.
; PLAN: r0=199(x), r1=208(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 208
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
