; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (147, 179) with width 39 and height 75. Then Sets a single orange pixel at (20, 174).
; PLAN: r0=147(x), r1=179(y), r2=39(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=20(x), r1=174(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (147, 179) with width 39 and height 75.
; PLAN: r0=147(x), r1=179(y), r2=39(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 179
LDI r2, 39
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (20, 174).
; PLAN: r0=20(x), r1=174(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 174
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
