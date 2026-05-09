; DESCRIPTION: Renders a black disk with center (212, 39) and radius 32.
; PLAN: r0=212(x), r1=39(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 39
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
