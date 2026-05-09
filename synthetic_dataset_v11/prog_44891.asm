; DESCRIPTION: Composite: . Then Sets a single orange pixel at (176, 78). Then Draws a cyan rectangle at (94, 101) with width 68 and height 112.
; PLAN: r0=176(x), r1=78(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=94(x), r1=101(y), r2=68(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (176, 78).
; PLAN: r0=176(x), r1=78(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 78
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan rectangle at (94, 101) with width 68 and height 112.
; PLAN: r0=94(x), r1=101(y), r2=68(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 101
LDI r2, 68
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
