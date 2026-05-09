; DESCRIPTION: Creates a white circular shape at (168, 90) with radius 68.
; PLAN: r0=168(x), r1=90(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 90
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
