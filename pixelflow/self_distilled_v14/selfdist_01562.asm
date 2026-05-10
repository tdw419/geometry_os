; DESCRIPTION: Renders a red circular shape at (105, 129) with radius 59.
; PLAN: r0=105(x), r1=129(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 129
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
