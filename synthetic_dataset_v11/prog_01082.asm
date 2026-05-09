; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (187, 94). Then Renders a black box of size 25x14 starting at (39, 11).
; PLAN: r0=187(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=39(x), r1=11(y), r2=25(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (187, 94).
; PLAN: r0=187(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 94
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 25x14 starting at (39, 11).
; PLAN: r0=39(x), r1=11(y), r2=25(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 11
LDI r2, 25
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
