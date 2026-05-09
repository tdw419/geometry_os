; DESCRIPTION: Places a black circle of radius 79 at center (263, 143).
; PLAN: r0=263(x), r1=143(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 143
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
