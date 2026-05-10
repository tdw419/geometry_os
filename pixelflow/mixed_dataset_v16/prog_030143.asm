; DESCRIPTION: Places a white circle of radius 43 at center (235, 79).
; PLAN: r0=235(x), r1=79(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 79
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
