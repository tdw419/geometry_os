; DESCRIPTION: Renders a purple circular shape at (59, 197) with radius 76.
; PLAN: r0=59(x), r1=197(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 197
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
