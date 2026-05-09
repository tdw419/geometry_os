; DESCRIPTION: Places a red circle of radius 29 at center (480, 102).
; PLAN: r0=480(x), r1=102(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 102
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
