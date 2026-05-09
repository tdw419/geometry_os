; DESCRIPTION: Creates a red circular shape at (354, 67) with radius 27.
; PLAN: r0=354(x), r1=67(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 67
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
