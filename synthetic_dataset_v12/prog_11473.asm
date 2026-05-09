; DESCRIPTION: Creates a green circular shape at (113, 160) with radius 14.
; PLAN: r0=113(x), r1=160(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 160
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
