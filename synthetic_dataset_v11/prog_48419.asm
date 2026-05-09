; DESCRIPTION: Creates a white circular shape at (154, 200) with radius 16.
; PLAN: r0=154(x), r1=200(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 200
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
