; DESCRIPTION: Renders a yellow disk with center (67, 129) and radius 61.
; PLAN: r0=67(x), r1=129(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 129
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
