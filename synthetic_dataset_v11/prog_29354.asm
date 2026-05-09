; DESCRIPTION: Places a blue circle of radius 14 at center (92, 65).
; PLAN: r0=92(x), r1=65(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 65
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
