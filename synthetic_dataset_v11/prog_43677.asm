; DESCRIPTION: Composite: . Then Places a orange dot at position (31, 135). Then Draws a orange circle centered at (63, 174) with radius 57.
; PLAN: r0=31(x), r1=135(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=63(x), r1=174(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (31, 135).
; PLAN: r0=31(x), r1=135(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 135
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a orange circle centered at (63, 174) with radius 57.
; PLAN: r0=63(x), r1=174(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 174
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
