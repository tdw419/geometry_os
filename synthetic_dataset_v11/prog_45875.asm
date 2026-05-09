; DESCRIPTION: Composite: . Then Places a cyan dot at position (62, 65). Then Draws a blue circle centered at (189, 41) with radius 13.
; PLAN: r0=62(x), r1=65(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=189(x), r1=41(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (62, 65).
; PLAN: r0=62(x), r1=65(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 65
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue circle centered at (189, 41) with radius 13.
; PLAN: r0=189(x), r1=41(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 41
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
