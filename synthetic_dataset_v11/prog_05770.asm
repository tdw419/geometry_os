; DESCRIPTION: Places a white circle of radius 27 at center (79, 128).
; PLAN: r0=79(x), r1=128(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 128
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
