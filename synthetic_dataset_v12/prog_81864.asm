; DESCRIPTION: Renders a cyan disk with center (26, 142) and radius 21.
; PLAN: r0=26(x), r1=142(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 142
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
