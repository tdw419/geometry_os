; DESCRIPTION: Creates a orange circular shape at (410, 129) with radius 74.
; PLAN: r0=410(x), r1=129(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 129
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
