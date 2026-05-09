; DESCRIPTION: Creates a purple circular shape at (75, 113) with radius 54.
; PLAN: r0=75(x), r1=113(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 113
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
