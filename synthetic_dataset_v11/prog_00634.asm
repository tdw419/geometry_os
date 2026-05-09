; DESCRIPTION: Composite: . Then Places a orange dot at position (41, 245). Then Creates a magenta rectangular region at (25, 57) spanning 94 by 11 pixels.
; PLAN: r0=41(x), r1=245(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=25(x), r1=57(y), r2=94(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (41, 245).
; PLAN: r0=41(x), r1=245(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 245
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta rectangular region at (25, 57) spanning 94 by 11 pixels.
; PLAN: r0=25(x), r1=57(y), r2=94(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 57
LDI r2, 94
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
