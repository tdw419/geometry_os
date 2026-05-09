; DESCRIPTION: Renders a white disk with center (202, 129) and radius 20.
; PLAN: r0=202(x), r1=129(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 129
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
