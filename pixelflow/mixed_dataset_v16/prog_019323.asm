; DESCRIPTION: Creates a white circular shape at (450, 128) with radius 54.
; PLAN: r0=450(x), r1=128(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 128
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
