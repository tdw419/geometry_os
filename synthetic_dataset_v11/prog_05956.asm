; DESCRIPTION: Composite: . Then Draws a red circle centered at (25, 153) with radius 15. Then Places a orange dot at position (5, 6).
; PLAN: r0=25(x), r1=153(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=5(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red circle centered at (25, 153) with radius 15.
; PLAN: r0=25(x), r1=153(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 153
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (5, 6).
; PLAN: r0=5(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 6
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
