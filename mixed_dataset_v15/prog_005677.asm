; DESCRIPTION: Places a orange circle of radius 32 at center (235, 178).
; PLAN: r0=235(x), r1=178(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 178
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
