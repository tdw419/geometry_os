; DESCRIPTION: Places a black circle of radius 61 at center (206, 159).
; PLAN: r0=206(x), r1=159(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 159
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
