; DESCRIPTION: Creates a white circular shape at (146, 151) with radius 49.
; PLAN: r0=146(x), r1=151(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 151
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
