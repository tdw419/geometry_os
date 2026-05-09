; DESCRIPTION: Composite: . Then Draws a red rectangle at (26, 146) with width 17 and height 94. Then Sets a single magenta pixel at (82, 22).
; PLAN: r0=26(x), r1=146(y), r2=17(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=82(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red rectangle at (26, 146) with width 17 and height 94.
; PLAN: r0=26(x), r1=146(y), r2=17(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 146
LDI r2, 17
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (82, 22).
; PLAN: r0=82(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
