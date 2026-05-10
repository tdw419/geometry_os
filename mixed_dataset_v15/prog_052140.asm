; DESCRIPTION: Creates a green circular shape at (403, 143) with radius 47.
; PLAN: r0=403(x), r1=143(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 143
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
