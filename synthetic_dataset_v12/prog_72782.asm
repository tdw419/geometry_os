; DESCRIPTION: Places a green circle of radius 64 at center (74, 165).
; PLAN: r0=74(x), r1=165(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 165
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
