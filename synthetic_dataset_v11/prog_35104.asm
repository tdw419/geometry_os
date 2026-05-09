; DESCRIPTION: Creates a white circular shape at (74, 111) with radius 19.
; PLAN: r0=74(x), r1=111(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 111
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
