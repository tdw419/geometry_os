; DESCRIPTION: Creates a blue circular shape at (102, 116) with radius 27.
; PLAN: r0=102(x), r1=116(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 116
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
