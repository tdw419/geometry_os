; DESCRIPTION: Creates a green circular shape at (386, 58) with radius 38.
; PLAN: r0=386(x), r1=58(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 58
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
