; DESCRIPTION: Renders a black disk with center (206, 173) and radius 32.
; PLAN: r0=206(x), r1=173(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 173
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
