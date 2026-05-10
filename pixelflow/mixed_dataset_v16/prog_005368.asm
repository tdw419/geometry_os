; DESCRIPTION: Renders a green disk with center (294, 60) and radius 60.
; PLAN: r0=294(x), r1=60(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 60
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
