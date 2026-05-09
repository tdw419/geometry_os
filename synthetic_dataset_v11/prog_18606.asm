; DESCRIPTION: Composite: . Then Places a orange dot at position (25, 255). Then Draws a yellow circle centered at (41, 143) with radius 29.
; PLAN: r0=25(x), r1=255(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=41(x), r1=143(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (25, 255).
; PLAN: r0=25(x), r1=255(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 255
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow circle centered at (41, 143) with radius 29.
; PLAN: r0=41(x), r1=143(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 143
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
