; DESCRIPTION: Composite: . Then Places a black dot at position (68, 126). Then Draws a white circle centered at (89, 188) with radius 58.
; PLAN: r0=68(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=89(x), r1=188(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (68, 126).
; PLAN: r0=68(x), r1=126(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 126
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (89, 188) with radius 58.
; PLAN: r0=89(x), r1=188(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 188
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
