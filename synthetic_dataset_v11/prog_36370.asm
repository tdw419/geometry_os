; DESCRIPTION: Renders a black disk with center (171, 143) and radius 16.
; PLAN: r0=171(x), r1=143(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 143
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
