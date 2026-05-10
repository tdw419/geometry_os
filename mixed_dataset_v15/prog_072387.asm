; DESCRIPTION: Renders a green disk with center (213, 197) and radius 22.
; PLAN: r0=213(x), r1=197(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 197
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
