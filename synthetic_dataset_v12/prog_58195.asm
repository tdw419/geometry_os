; DESCRIPTION: Creates a magenta circular shape at (415, 185) with radius 41.
; PLAN: r0=415(x), r1=185(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 185
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
