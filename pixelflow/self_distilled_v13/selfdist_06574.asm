; DESCRIPTION: Renders a purple circular shape at (360, 32) with radius 59.
; PLAN: r0=360(x), r1=32(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 32
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
