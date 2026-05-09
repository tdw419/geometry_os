; DESCRIPTION: Creates a white circular shape at (174, 79) with radius 44.
; PLAN: r0=174(x), r1=79(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 79
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
