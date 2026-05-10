; DESCRIPTION: Renders a green disk with center (69, 163) and radius 42.
; PLAN: r0=69(x), r1=163(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 163
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
