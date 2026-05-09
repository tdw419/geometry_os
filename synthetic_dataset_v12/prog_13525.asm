; DESCRIPTION: Creates a magenta circular shape at (287, 98) with radius 70.
; PLAN: r0=287(x), r1=98(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 98
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
