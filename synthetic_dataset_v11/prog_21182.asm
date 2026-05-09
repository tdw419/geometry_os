; DESCRIPTION: Places a yellow circle of radius 24 at center (173, 130).
; PLAN: r0=173(x), r1=130(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 130
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
