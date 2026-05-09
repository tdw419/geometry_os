; DESCRIPTION: Creates a red circular shape at (173, 192) with radius 60.
; PLAN: r0=173(x), r1=192(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 192
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
