; DESCRIPTION: Creates a green circular shape at (292, 63) with radius 27.
; PLAN: r0=292(x), r1=63(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 63
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
