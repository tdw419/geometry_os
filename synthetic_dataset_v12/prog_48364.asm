; DESCRIPTION: Places a purple circle of radius 12 at center (479, 133).
; PLAN: r0=479(x), r1=133(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 133
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
