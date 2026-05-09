; DESCRIPTION: Composite: . Then Places a black dot at position (119, 208). Then Draws a white circle centered at (147, 167) with radius 58.
; PLAN: r0=119(x), r1=208(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=147(x), r1=167(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (119, 208).
; PLAN: r0=119(x), r1=208(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 208
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (147, 167) with radius 58.
; PLAN: r0=147(x), r1=167(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 167
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
