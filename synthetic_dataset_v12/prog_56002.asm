; DESCRIPTION: Places a yellow circle of radius 44 at center (464, 167).
; PLAN: r0=464(x), r1=167(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 167
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
