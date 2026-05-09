; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (82, 76) with radius 60. Then Places a cyan dot at position (159, 82).
; PLAN: r0=82(x), r1=76(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=159(x), r1=82(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow circle centered at (82, 76) with radius 60.
; PLAN: r0=82(x), r1=76(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 76
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (159, 82).
; PLAN: r0=159(x), r1=82(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 82
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
