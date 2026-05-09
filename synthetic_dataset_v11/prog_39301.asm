; DESCRIPTION: Renders a green disk with center (127, 139) and radius 28.
; PLAN: r0=127(x), r1=139(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 139
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
