; DESCRIPTION: Places a green circle of radius 27 at center (194, 193).
; PLAN: r0=194(x), r1=193(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 193
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
