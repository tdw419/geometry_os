; DESCRIPTION: Places a blue circle of radius 29 at center (242, 199).
; PLAN: r0=242(x), r1=199(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 199
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
