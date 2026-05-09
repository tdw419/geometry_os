; DESCRIPTION: Creates a green circular shape at (386, 151) with radius 53.
; PLAN: r0=386(x), r1=151(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 151
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
