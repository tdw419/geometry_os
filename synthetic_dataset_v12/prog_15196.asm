; DESCRIPTION: Places a purple circle of radius 55 at center (296, 151).
; PLAN: r0=296(x), r1=151(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 151
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
