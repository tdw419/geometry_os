; DESCRIPTION: Renders a cyan disk with center (130, 177) and radius 78.
; PLAN: r0=130(x), r1=177(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 177
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
