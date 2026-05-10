; DESCRIPTION: Creates a red circular shape at (420, 67) with radius 50.
; PLAN: r0=420(x), r1=67(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 67
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
