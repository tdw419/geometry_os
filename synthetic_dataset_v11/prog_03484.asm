; DESCRIPTION: Composite: . Then Draws a red circle centered at (124, 139) with radius 76. Then Places a black dot at position (43, 234).
; PLAN: r0=124(x), r1=139(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=43(x), r1=234(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red circle centered at (124, 139) with radius 76.
; PLAN: r0=124(x), r1=139(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 139
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (43, 234).
; PLAN: r0=43(x), r1=234(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 234
LDI r2, 0x000000
PSET r0, r1, r2
HALT
