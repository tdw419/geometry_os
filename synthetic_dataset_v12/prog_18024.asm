; DESCRIPTION: Renders a cyan disk with center (268, 99) and radius 76.
; PLAN: r0=268(x), r1=99(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 99
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
