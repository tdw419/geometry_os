; DESCRIPTION: Composite: . Then Sets a single orange pixel at (115, 93). Then Draws a yellow rectangle at (135, 94) with width 82 and height 15.
; PLAN: r0=115(x), r1=93(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=135(x), r1=94(y), r2=82(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (115, 93).
; PLAN: r0=115(x), r1=93(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 93
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow rectangle at (135, 94) with width 82 and height 15.
; PLAN: r0=135(x), r1=94(y), r2=82(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 94
LDI r2, 82
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
