; DESCRIPTION: Renders a green disk with center (209, 171) and radius 28.
; PLAN: r0=209(x), r1=171(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 171
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
