; DESCRIPTION: Renders a cyan disk with center (357, 88) and radius 30.
; PLAN: r0=357(x), r1=88(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 88
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
