; DESCRIPTION: Creates a white circular shape at (391, 149) with radius 25.
; PLAN: r0=391(x), r1=149(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 149
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
