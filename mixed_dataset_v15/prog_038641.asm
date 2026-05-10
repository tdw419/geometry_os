; DESCRIPTION: Creates a green circular shape at (113, 195) with radius 61.
; PLAN: r0=113(x), r1=195(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 195
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
