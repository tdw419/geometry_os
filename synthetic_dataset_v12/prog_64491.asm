; DESCRIPTION: Renders a red disk with center (238, 129) and radius 36.
; PLAN: r0=238(x), r1=129(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 129
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
