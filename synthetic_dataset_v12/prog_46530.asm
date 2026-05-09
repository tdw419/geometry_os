; DESCRIPTION: Renders a cyan disk with center (163, 97) and radius 55.
; PLAN: r0=163(x), r1=97(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 97
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
