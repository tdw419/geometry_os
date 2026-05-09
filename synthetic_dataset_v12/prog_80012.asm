; DESCRIPTION: Creates a green circular shape at (403, 205) with radius 26.
; PLAN: r0=403(x), r1=205(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 205
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
