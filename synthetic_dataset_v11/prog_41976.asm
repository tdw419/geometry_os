; DESCRIPTION: Composite: . Then Draws a purple rectangle at (154, 146) with width 49 and height 60. Then Sets a single black pixel at (180, 146).
; PLAN: r0=154(x), r1=146(y), r2=49(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=180(x), r1=146(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (154, 146) with width 49 and height 60.
; PLAN: r0=154(x), r1=146(y), r2=49(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 146
LDI r2, 49
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (180, 146).
; PLAN: r0=180(x), r1=146(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 146
LDI r2, 0x000000
PSET r0, r1, r2
HALT
