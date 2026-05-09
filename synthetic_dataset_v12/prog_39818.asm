; DESCRIPTION: Draws a red circle centered at (234, 117) with radius 11.
; PLAN: r0=234(x), r1=117(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 117
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
