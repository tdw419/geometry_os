; DESCRIPTION: Creates a white circular shape at (174, 135) with radius 72.
; PLAN: r0=174(x), r1=135(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 135
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
