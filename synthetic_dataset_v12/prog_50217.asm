; DESCRIPTION: Creates a white circular shape at (294, 99) with radius 56.
; PLAN: r0=294(x), r1=99(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 99
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
