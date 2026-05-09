; DESCRIPTION: Creates a white circular shape at (440, 21) with radius 20.
; PLAN: r0=440(x), r1=21(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 21
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
