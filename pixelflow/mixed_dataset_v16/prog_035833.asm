; DESCRIPTION: Renders a black disk with center (173, 153) and radius 44.
; PLAN: r0=173(x), r1=153(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 153
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
