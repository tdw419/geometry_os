; DESCRIPTION: Creates a white circular shape at (245, 168) with radius 50.
; PLAN: r0=245(x), r1=168(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 168
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
