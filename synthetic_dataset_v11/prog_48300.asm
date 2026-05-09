; DESCRIPTION: Composite: . Then Renders a white box of size 24x117 starting at (1, 60). Then Sets a single cyan pixel at (90, 41).
; PLAN: r0=1(x), r1=60(y), r2=24(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x), r1=41(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 24x117 starting at (1, 60).
; PLAN: r0=1(x), r1=60(y), r2=24(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 60
LDI r2, 24
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (90, 41).
; PLAN: r0=90(x), r1=41(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 41
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
