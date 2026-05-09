; DESCRIPTION: Creates a orange circular shape at (240, 77) with radius 21.
; PLAN: r0=240(x), r1=77(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 77
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
