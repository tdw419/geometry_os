; DESCRIPTION: Renders a cyan disk with center (157, 223) and radius 11.
; PLAN: r0=157(x), r1=223(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 223
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
