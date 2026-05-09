; DESCRIPTION: Creates a white circular shape at (225, 127) with radius 60.
; PLAN: r0=225(x), r1=127(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 127
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
