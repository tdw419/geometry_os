; DESCRIPTION: Places a black circle of radius 39 at center (235, 146).
; PLAN: r0=235(x), r1=146(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 146
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
