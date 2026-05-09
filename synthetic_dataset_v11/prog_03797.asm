; DESCRIPTION: Composite: . Then Places a orange dot at position (75, 185). Then Renders a magenta box of size 64x39 starting at (178, 41).
; PLAN: r0=75(x), r1=185(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=178(x), r1=41(y), r2=64(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (75, 185).
; PLAN: r0=75(x), r1=185(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 185
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta box of size 64x39 starting at (178, 41).
; PLAN: r0=178(x), r1=41(y), r2=64(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 41
LDI r2, 64
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
