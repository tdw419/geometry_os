; DESCRIPTION: Creates a white circular shape at (27, 209) with radius 18.
; PLAN: r0=27(x), r1=209(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 209
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
