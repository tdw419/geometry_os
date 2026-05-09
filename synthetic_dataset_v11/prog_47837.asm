; DESCRIPTION: Renders a red disk with center (62, 129) and radius 32.
; PLAN: r0=62(x), r1=129(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 129
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
