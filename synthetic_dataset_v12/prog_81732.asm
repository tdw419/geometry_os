; DESCRIPTION: Renders a green disk with center (436, 221) and radius 32.
; PLAN: r0=436(x), r1=221(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 221
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
