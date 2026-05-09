; DESCRIPTION: Renders a green disk with center (143, 82) and radius 22.
; PLAN: r0=143(x), r1=82(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 82
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
