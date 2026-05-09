; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (113, 83) with width 29 and height 65. Then Sets a single orange pixel at (166, 145).
; PLAN: r0=113(x), r1=83(y), r2=29(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=166(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan rectangle at (113, 83) with width 29 and height 65.
; PLAN: r0=113(x), r1=83(y), r2=29(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 83
LDI r2, 29
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (166, 145).
; PLAN: r0=166(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 145
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
