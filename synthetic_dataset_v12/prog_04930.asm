; DESCRIPTION: Places a green circle of radius 71 at center (234, 144).
; PLAN: r0=234(x), r1=144(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 144
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
