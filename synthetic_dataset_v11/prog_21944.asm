; DESCRIPTION: Renders a black disk with center (135, 173) and radius 34.
; PLAN: r0=135(x), r1=173(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 173
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
