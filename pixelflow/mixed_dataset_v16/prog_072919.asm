; DESCRIPTION: Creates a red circular shape at (258, 129) with radius 44.
; PLAN: r0=258(x), r1=129(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 129
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
