; DESCRIPTION: Places a purple circle of radius 36 at center (192, 202).
; PLAN: r0=192(x), r1=202(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 202
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
