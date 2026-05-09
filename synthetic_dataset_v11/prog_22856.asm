; DESCRIPTION: Composite: . Then Renders a cyan box of size 112x71 starting at (97, 18). Then Places a orange dot at position (28, 131).
; PLAN: r0=97(x), r1=18(y), r2=112(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=28(x), r1=131(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 112x71 starting at (97, 18).
; PLAN: r0=97(x), r1=18(y), r2=112(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 18
LDI r2, 112
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (28, 131).
; PLAN: r0=28(x), r1=131(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 131
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
