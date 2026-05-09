; DESCRIPTION: Places a black circle of radius 48 at center (434, 159).
; PLAN: r0=434(x), r1=159(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 159
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
