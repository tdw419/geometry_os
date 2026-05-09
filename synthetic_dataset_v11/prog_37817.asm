; DESCRIPTION: Composite: . Then Renders a white box of size 39x41 starting at (158, 64). Then Sets a single orange pixel at (245, 1).
; PLAN: r0=158(x), r1=64(y), r2=39(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=245(x), r1=1(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 39x41 starting at (158, 64).
; PLAN: r0=158(x), r1=64(y), r2=39(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 64
LDI r2, 39
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (245, 1).
; PLAN: r0=245(x), r1=1(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 1
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
