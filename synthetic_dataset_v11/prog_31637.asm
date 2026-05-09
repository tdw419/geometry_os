; DESCRIPTION: Creates a green circular shape at (206, 113) with radius 47.
; PLAN: r0=206(x), r1=113(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 113
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
