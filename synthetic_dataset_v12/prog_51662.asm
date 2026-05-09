; DESCRIPTION: Creates a white circular shape at (369, 166) with radius 21.
; PLAN: r0=369(x), r1=166(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 166
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
