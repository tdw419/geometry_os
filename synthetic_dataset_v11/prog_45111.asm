; DESCRIPTION: Composite: . Then Sets a single orange pixel at (212, 4). Then Draws a red rectangle at (57, 74) with width 119 and height 10.
; PLAN: r0=212(x), r1=4(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=57(x), r1=74(y), r2=119(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (212, 4).
; PLAN: r0=212(x), r1=4(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 4
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a red rectangle at (57, 74) with width 119 and height 10.
; PLAN: r0=57(x), r1=74(y), r2=119(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 74
LDI r2, 119
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
