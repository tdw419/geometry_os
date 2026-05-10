; DESCRIPTION: Renders a cyan disk with center (157, 57) and radius 52.
; PLAN: r0=157(x), r1=57(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 57
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
