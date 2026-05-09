; DESCRIPTION: Composite: . Then Draws a green circle centered at (133, 161) with radius 76. Then Places a black dot at position (100, 246).
; PLAN: r0=133(x), r1=161(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=100(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green circle centered at (133, 161) with radius 76.
; PLAN: r0=133(x), r1=161(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 161
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (100, 246).
; PLAN: r0=100(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 246
LDI r2, 0x000000
PSET r0, r1, r2
HALT
