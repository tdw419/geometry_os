; DESCRIPTION: Places a blue circle of radius 16 at center (238, 29).
; PLAN: r0=238(x), r1=29(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 29
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
