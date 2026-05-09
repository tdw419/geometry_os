; DESCRIPTION: Renders a cyan disk with center (157, 154) and radius 17.
; PLAN: r0=157(x), r1=154(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 154
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
