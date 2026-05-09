; DESCRIPTION: Renders a cyan disk with center (143, 188) and radius 66.
; PLAN: r0=143(x), r1=188(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 188
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
