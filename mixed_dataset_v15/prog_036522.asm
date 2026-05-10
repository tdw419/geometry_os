; DESCRIPTION: Renders a white circular shape at (387, 156) with radius 79.
; PLAN: r0=387(x), r1=156(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 156
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
