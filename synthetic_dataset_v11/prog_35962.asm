; DESCRIPTION: Composite: . Then Draws a white circle centered at (53, 69) with radius 50. Then Places a black dot at position (247, 22).
; PLAN: r0=53(x), r1=69(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=247(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (53, 69) with radius 50.
; PLAN: r0=53(x), r1=69(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 69
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (247, 22).
; PLAN: r0=247(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 22
LDI r2, 0x000000
PSET r0, r1, r2
HALT
