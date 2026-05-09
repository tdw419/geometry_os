; DESCRIPTION: Creates a green circular shape at (215, 155) with radius 64.
; PLAN: r0=215(x), r1=155(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 155
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
