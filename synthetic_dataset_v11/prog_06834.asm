; DESCRIPTION: Composite: . Then Renders a cyan box of size 74x117 starting at (39, 112). Then Sets a single cyan pixel at (19, 2).
; PLAN: r0=39(x), r1=112(y), r2=74(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=19(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 74x117 starting at (39, 112).
; PLAN: r0=39(x), r1=112(y), r2=74(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 112
LDI r2, 74
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (19, 2).
; PLAN: r0=19(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 2
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
