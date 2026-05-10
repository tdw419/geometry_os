; DESCRIPTION: Renders a orange circular shape at (18, 129) with radius 56.
; PLAN: r0=18(x), r1=129(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 129
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
