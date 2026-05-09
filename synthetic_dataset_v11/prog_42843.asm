; DESCRIPTION: Composite: . Then Draws a orange circle centered at (82, 113) with radius 48. Then Places a orange dot at position (106, 202).
; PLAN: r0=82(x), r1=113(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=106(x), r1=202(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange circle centered at (82, 113) with radius 48.
; PLAN: r0=82(x), r1=113(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 113
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (106, 202).
; PLAN: r0=106(x), r1=202(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 202
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
