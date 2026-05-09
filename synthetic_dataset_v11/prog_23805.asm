; DESCRIPTION: Creates a green circular shape at (79, 117) with radius 51.
; PLAN: r0=79(x), r1=117(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 117
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
