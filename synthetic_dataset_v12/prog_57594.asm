; DESCRIPTION: Places a green circle of radius 60 at center (296, 81).
; PLAN: r0=296(x), r1=81(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 81
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
