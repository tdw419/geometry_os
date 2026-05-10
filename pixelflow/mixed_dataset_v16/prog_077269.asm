; DESCRIPTION: Renders a green disk with center (384, 156) and radius 58.
; PLAN: r0=384(x), r1=156(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 156
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
