; DESCRIPTION: Renders a yellow disk with center (187, 129) and radius 37.
; PLAN: r0=187(x), r1=129(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 129
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
