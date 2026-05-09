; DESCRIPTION: Renders a cyan disk with center (203, 165) and radius 38.
; PLAN: r0=203(x), r1=165(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 165
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
