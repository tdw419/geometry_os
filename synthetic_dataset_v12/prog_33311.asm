; DESCRIPTION: Renders a green disk with center (246, 154) and radius 35.
; PLAN: r0=246(x), r1=154(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 154
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
