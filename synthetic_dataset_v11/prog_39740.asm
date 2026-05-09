; DESCRIPTION: Composite: . Then Places a purple dot at position (180, 82). Then Draws a blue circle centered at (153, 41) with radius 33.
; PLAN: r0=180(x), r1=82(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=153(x), r1=41(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (180, 82).
; PLAN: r0=180(x), r1=82(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 82
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue circle centered at (153, 41) with radius 33.
; PLAN: r0=153(x), r1=41(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 41
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
