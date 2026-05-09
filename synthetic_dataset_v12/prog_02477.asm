; DESCRIPTION: Renders a cyan disk with center (157, 116) and radius 60.
; PLAN: r0=157(x), r1=116(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 116
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
