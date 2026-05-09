; DESCRIPTION: Renders a cyan disk with center (244, 40) and radius 12.
; PLAN: r0=244(x), r1=40(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 40
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
