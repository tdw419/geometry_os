; DESCRIPTION: Places a blue circle of radius 43 at center (358, 192).
; PLAN: r0=358(x), r1=192(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 192
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
