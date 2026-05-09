; DESCRIPTION: Creates a white circular shape at (146, 114) with radius 58.
; PLAN: r0=146(x), r1=114(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 114
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
