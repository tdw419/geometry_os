; DESCRIPTION: Creates a purple circular shape at (286, 195) with radius 59.
; PLAN: r0=286(x), r1=195(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 195
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
