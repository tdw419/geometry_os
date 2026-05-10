; DESCRIPTION: Creates a green circular shape at (362, 117) with radius 30.
; PLAN: r0=362(x), r1=117(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 117
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
