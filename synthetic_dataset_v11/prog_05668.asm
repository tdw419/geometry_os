; DESCRIPTION: Renders a cyan disk with center (114, 151) and radius 66.
; PLAN: r0=114(x), r1=151(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 151
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
