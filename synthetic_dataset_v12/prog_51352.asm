; DESCRIPTION: Creates a green circular shape at (43, 126) with radius 40.
; PLAN: r0=43(x), r1=126(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 126
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
