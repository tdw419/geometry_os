; DESCRIPTION: Creates a white circular shape at (440, 59) with radius 17.
; PLAN: r0=440(x), r1=59(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 59
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
