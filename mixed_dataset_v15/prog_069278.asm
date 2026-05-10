; DESCRIPTION: Renders a green disk with center (209, 134) and radius 47.
; PLAN: r0=209(x), r1=134(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 134
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
