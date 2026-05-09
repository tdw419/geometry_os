; DESCRIPTION: Creates a red circular shape at (54, 129) with radius 13.
; PLAN: r0=54(x), r1=129(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 129
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
