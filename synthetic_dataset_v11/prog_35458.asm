; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (86, 251). Then Draws a cyan rectangle at (81, 71) with width 110 and height 67.
; PLAN: r0=86(x), r1=251(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=81(x), r1=71(y), r2=110(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (86, 251).
; PLAN: r0=86(x), r1=251(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 251
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan rectangle at (81, 71) with width 110 and height 67.
; PLAN: r0=81(x), r1=71(y), r2=110(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 71
LDI r2, 110
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
