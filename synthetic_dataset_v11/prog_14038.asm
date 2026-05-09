; DESCRIPTION: Creates a red circular shape at (69, 129) with radius 57.
; PLAN: r0=69(x), r1=129(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 129
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
