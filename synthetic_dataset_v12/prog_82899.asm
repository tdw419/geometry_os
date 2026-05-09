; DESCRIPTION: Renders a cyan disk with center (359, 140) and radius 62.
; PLAN: r0=359(x), r1=140(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 140
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
