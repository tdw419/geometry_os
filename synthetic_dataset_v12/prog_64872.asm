; DESCRIPTION: Creates a cyan circular shape at (285, 113) with radius 74.
; PLAN: r0=285(x), r1=113(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 113
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
