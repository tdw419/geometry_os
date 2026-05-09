; DESCRIPTION: Composite: . Then Draws a blue rectangle at (94, 102) with width 42 and height 118. Then Sets a single red pixel at (205, 178).
; PLAN: r0=94(x), r1=102(y), r2=42(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=205(x), r1=178(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue rectangle at (94, 102) with width 42 and height 118.
; PLAN: r0=94(x), r1=102(y), r2=42(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 102
LDI r2, 42
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (205, 178).
; PLAN: r0=205(x), r1=178(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 178
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
