; DESCRIPTION: Places a black circle of radius 64 at center (373, 180).
; PLAN: r0=373(x), r1=180(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 180
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
