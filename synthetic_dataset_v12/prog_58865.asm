; DESCRIPTION: Creates a white circular shape at (374, 150) with radius 32.
; PLAN: r0=374(x), r1=150(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 150
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
