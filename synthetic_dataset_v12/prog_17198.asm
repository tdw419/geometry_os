; DESCRIPTION: Renders a green disk with center (111, 143) and radius 12.
; PLAN: r0=111(x), r1=143(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 143
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
