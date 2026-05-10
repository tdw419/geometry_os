; DESCRIPTION: Creates a green circular shape at (82, 178) with radius 72.
; PLAN: r0=82(x), r1=178(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 178
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
