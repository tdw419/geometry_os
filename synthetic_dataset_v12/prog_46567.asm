; DESCRIPTION: Places a green circle of radius 28 at center (141, 36).
; PLAN: r0=141(x), r1=36(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 36
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
