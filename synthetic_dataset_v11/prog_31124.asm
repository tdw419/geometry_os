; DESCRIPTION: Renders a white disk with center (161, 242) and radius 12.
; PLAN: r0=161(x), r1=242(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 242
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
