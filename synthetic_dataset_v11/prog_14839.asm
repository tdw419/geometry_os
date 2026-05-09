; DESCRIPTION: Composite: . Then Draws a red rectangle at (190, 148) with width 45 and height 43. Then Sets a single black pixel at (79, 180).
; PLAN: r0=190(x), r1=148(y), r2=45(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=79(x), r1=180(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red rectangle at (190, 148) with width 45 and height 43.
; PLAN: r0=190(x), r1=148(y), r2=45(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 148
LDI r2, 45
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (79, 180).
; PLAN: r0=79(x), r1=180(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 180
LDI r2, 0x000000
PSET r0, r1, r2
HALT
