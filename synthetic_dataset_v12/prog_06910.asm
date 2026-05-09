; DESCRIPTION: Creates a green circular shape at (416, 171) with radius 43.
; PLAN: r0=416(x), r1=171(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 171
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
