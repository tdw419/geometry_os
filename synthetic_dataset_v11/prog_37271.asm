; DESCRIPTION: Creates a white circular shape at (59, 146) with radius 54.
; PLAN: r0=59(x), r1=146(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 146
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
