; DESCRIPTION: Renders a green disk with center (107, 154) and radius 49.
; PLAN: r0=107(x), r1=154(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 154
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
