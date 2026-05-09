; DESCRIPTION: Composite: . Then Places a orange dot at position (78, 149). Then Creates a orange rectangular region at (125, 76) spanning 115 by 27 pixels.
; PLAN: r0=78(x), r1=149(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=125(x), r1=76(y), r2=115(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (78, 149).
; PLAN: r0=78(x), r1=149(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 149
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a orange rectangular region at (125, 76) spanning 115 by 27 pixels.
; PLAN: r0=125(x), r1=76(y), r2=115(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 76
LDI r2, 115
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
