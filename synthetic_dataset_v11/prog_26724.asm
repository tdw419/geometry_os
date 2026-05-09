; DESCRIPTION: Composite: . Then Sets a single orange pixel at (123, 176). Then Renders a black box of size 84x114 starting at (159, 26).
; PLAN: r0=123(x), r1=176(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=159(x), r1=26(y), r2=84(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (123, 176).
; PLAN: r0=123(x), r1=176(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 123
LDI r1, 176
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 84x114 starting at (159, 26).
; PLAN: r0=159(x), r1=26(y), r2=84(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 26
LDI r2, 84
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
