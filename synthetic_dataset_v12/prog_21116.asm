; DESCRIPTION: Renders a cyan disk with center (203, 46) and radius 35.
; PLAN: r0=203(x), r1=46(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 46
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
